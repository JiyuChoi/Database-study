// Set: value
const s = set([1])

// Map: key, value
const map = new Map();
map.set("age", 18);
map.entries();
map.has("age"); //true
map.get("age"); //18

map.set("age", 13); // 덮어쓰기 가능
