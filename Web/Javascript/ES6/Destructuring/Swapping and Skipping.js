let mon = "Sat";
let sat = "Mon";

// 1. Swapping
[sat, mon] = [mon, sat]; // = ["Sat", "Mon"];


// 2. Skipping
const days = ["mon", "tue", "wed", "thu", "fri"];

// 특정 값만 뽑을 때 
const [, , , thu, fri] = days;
console.log(thr, fri);
