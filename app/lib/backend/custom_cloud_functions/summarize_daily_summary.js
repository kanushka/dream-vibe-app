const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.summarizeDailyData = functions.pubsub
    .schedule("0 0 * * *") // This will run every day at midnight
    .onRun(async (context) => {
        const today = new Date();
        today.setHours(0, 0, 0, 0); // Set to start of today
        const tomorrow = new Date(today);
        tomorrow.setDate(tomorrow.getDate() + 1); // Set to start of tomorrow

        const usersRef = admin.firestore().collection("users");
        const userSnapshots = await usersRef.get();

        const summaries = [];

        for (const userDoc of userSnapshots.docs) {
            const uid = userDoc.id;
            let totalSteps = 0;
            let totalDistance = 0;
            let totalBurnedCalories = 0;
            let avgHeartRate = 0;
            let totalExerciseMinutes = 0;
            let bedInTime = 0;
            let asleepTime = 0;
            let awakeTime = 0;
            let deepSleepTime = 0;
            let predictedScore = 0;
            let score = 0;

            // Calculate total steps for the day
            const stepsRef = userDoc.ref.collection("steps");
            const todayStepsSnapshot = await stepsRef
                .where("start_time", ">=", admin.firestore.Timestamp.fromDate(today))
                .where("start_time", "<", admin.firestore.Timestamp.fromDate(tomorrow))
                .get();

            todayStepsSnapshot.forEach((doc) => {
                totalSteps += doc.data().steps;
            });

            // Calculate total distance for the day
            const distanceSnapshot = await userDoc.ref
                .collection("distance")
                .where("start_time", ">=", admin.firestore.Timestamp.fromDate(today))
                .where("start_time", "<", admin.firestore.Timestamp.fromDate(tomorrow))
                .get();

            distanceSnapshot.forEach((doc) => {
                totalDistance += doc.data().distance;
            });

            // Calculate total distance for the day
            const energySnapshot = await userDoc.ref
                .collection("active_energy")
                .where("start_time", ">=", admin.firestore.Timestamp.fromDate(today))
                .where("start_time", "<", admin.firestore.Timestamp.fromDate(tomorrow))
                .get();

            energySnapshot.forEach((doc) => {
                totalDistance += doc.data().calories;
            });

            // calculate average heart rate for the day
            const heartRateSnapshot = await userDoc.ref
                .collection("heart_rate")
                .where("start_time", ">=", admin.firestore.Timestamp.fromDate(today))
                .where("start_time", "<", admin.firestore.Timestamp.fromDate(tomorrow))
                .get();

            let sumHeartRate = 0;
            let count = 0;

            heartRateSnapshot.forEach((doc) => {
                sumHeartRate += doc.data().rate;
                count++;
            });

            avgHeartRate = sumHeartRate / count;

            // total exercise minutes
            const exerciseSnapshot = await userDoc.ref
                .collection("exercises")
                .where("start_time", ">=", admin.firestore.Timestamp.fromDate(today))
                .where("start_time", "<", admin.firestore.Timestamp.fromDate(tomorrow))
                .get();

            exerciseSnapshot.forEach((doc) => {
                totalExerciseMinutes += doc.data().total_time;
            });

            // total bed in minutes
            const bedInSnapshot = await userDoc.ref
                .collection("sleep")
                .where("start_time", ">=", admin.firestore.Timestamp.fromDate(today))
                .where("start_time", "<", admin.firestore.Timestamp.fromDate(tomorrow))
                .get();

            bedInSnapshot.forEach((doc) => {
                bedInTime += doc.data().in_bed;
                asleepTime += doc.data().asleep;
                awakeTime += doc.data().awake;
                deepSleepTime += doc.data().deep_sleep;
            });

            // last predicted score for the day
            const predictedScoreSnapshot = await userDoc.ref
                .collection("predicted_score")
                .where("created_time", ">=", admin.firestore.Timestamp.fromDate(today))
                .where("created_time", "<", admin.firestore.Timestamp.fromDate(tomorrow))
                .sort("created_time", "desc")
                .get();
            score = predictedScoreSnapshot.docs[0]?.data().score;

            // last actual score for the day
            const scoreSnapshot = await userDoc.ref
                .collection("score")
                .where("created_time", ">=", admin.firestore.Timestamp.fromDate(today))
                .where("created_time", "<", admin.firestore.Timestamp.fromDate(tomorrow))
                .sort("created_time", "desc")
                .get();
            predictedScore = scoreSnapshot.docs[0]?.data().score;

            const summary = {
                uid,
                date: admin.firestore.Timestamp.fromDate(today),
                totalSteps,
                totalDistance,
                totalBurnedCalories,
                avgHeartRate,
                totalExerciseMinutes,
                bedInTime,
                asleepTime,
                awakeTime,
                deepSleepTime,
                score,
                predictedScore,
            };
            summaries.push(summary);
        }

        // Batch write to summary collection
        const summaryRef = admin.firestore().collection("summary");
        const batch = admin.firestore().batch();
        summaries.forEach((summary) => {
            const docRef = summaryRef.doc(`${summary.uid}_${summary.date.toDate().toISOString().split("T")[0]}`);
            batch.set(docRef, summary);
        });

        await batch.commit();
        console.log("Daily summaries have been created.");
        return null;
    });
