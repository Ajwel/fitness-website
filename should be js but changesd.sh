const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

const shifts = {
  morning: { label: "Morning boost", time: "6:00 AM - 7:00 AM" },
  lunch: { label: "Lunch break", time: "12:30 PM - 1:15 PM" },
  evening: { label: "Evening power", time: "6:30 PM - 7:45 PM" },
  night: { label: "Night reset", time: "9:00 PM - 9:45 PM" }
};

const plans = {
  strength: {
    label: "Strength",
    focus: "Strength fuel",
    nutrition: "Aim for protein at each meal, steady carbs around training, and enough sleep to make heavy sessions count.",
    workouts: [
      ["Lower strength", "Squat pattern, hamstrings, calves"],
      ["Upper push", "Bench press, shoulders, triceps"],
      ["Pull strength", "Rows, pull-downs, biceps"],
      ["Lower power", "Deadlift pattern, glutes, core"],
      ["Upper volume", "Press, row, arms, carry finisher"],
      ["Mobility", "Hips, thoracic spine, easy zone 2"],
      ["Recovery", "Walk, stretch, meal prep"]
    ]
  },
  fatloss: {
    label: "Fat loss",
    focus: "Lean routine",
    nutrition: "Build plates with lean protein, high-fiber plants, and measured carbs so the calorie deficit feels steady.",
    workouts: [
      ["Full body A", "Squat, push, pull, 10-minute intervals"],
      ["Conditioning", "Bike or row intervals plus core"],
      ["Full body B", "Hinge, lunge, press, loaded carries"],
      ["Tempo cardio", "Zone 2 cardio and mobility"],
      ["Metabolic lift", "Circuits, sled work, short rests"],
      ["Steps goal", "Long walk and stretch"],
      ["Recovery", "Easy movement, plan meals"]
    ]
  },
  endurance: {
    label: "Endurance",
    focus: "Endurance plate",
    nutrition: "Keep carbs consistent, hydrate early, and add protein after sessions to help your legs come back fresh.",
    workouts: [
      ["Base cardio", "Zone 2 run, ride, or row"],
      ["Strength support", "Full body lifts, moderate load"],
      ["Intervals", "Short repeats with full warmup"],
      ["Mobility", "Core, hips, ankles, breath work"],
      ["Long aerobic", "Sustainable pace, relaxed finish"],
      ["Technique", "Drills, strides, light accessories"],
      ["Recovery", "Walk and gentle stretching"]
    ]
  }
};

const form = document.querySelector("#plannerForm");
const goalSelect = document.querySelector("#goalSelect");
const shiftSelect = document.querySelector("#shiftSelect");
const daysRange = document.querySelector("#daysRange");
const daysValue = document.querySelector("#daysValue");
const weekGrid = document.querySelector("#weekGrid");
const planName = document.querySelector("#planName");
const planTime = document.querySelector("#planTime");
const nutritionFocus = document.querySelector("#nutritionFocus");
const nutritionCopy = document.querySelector("#nutritionCopy");

function renderPlan() {
  const goal = plans[goalSelect.value];
  const shift = shifts[shiftSelect.value];
  const activeDays = Number(daysRange.value);

  daysValue.textContent = activeDays;
  planName.textContent = `${goal.label} - ${shift.label}`;
  planTime.textContent = shift.time;
  nutritionFocus.textContent = goal.focus;
  nutritionCopy.textContent = goal.nutrition;

  weekGrid.innerHTML = "";

  days.forEach((day, index) => {
    const workout = goal.workouts[index];
    const isRest = index >= activeDays;
    const card = document.createElement("article");
    card.className = `day-card${isRest ? " is-rest" : ""}`;
    card.innerHTML = `
      <span>${day}</span>
      <h4>${isRest ? "Recovery" : workout[0]}</h4>
      <p>${isRest ? "Easy walk, stretching, hydration, and sleep focus." : workout[1]}</p>
    `;
    weekGrid.appendChild(card);
  });
}

form.addEventListener("submit", (event) => {
  event.preventDefault();
  renderPlan();
});

[goalSelect, shiftSelect, daysRange].forEach((control) => {
  control.addEventListener("input", renderPlan);
});

renderPlan();

