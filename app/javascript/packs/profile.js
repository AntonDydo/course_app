console.log('working');
all = document.querySelector(".profile-option-item.all");
fav = document.querySelector(".profile-option-item.fav");
console.log(all);
all.addEventListener("click", () => {
	all.classList.toggle("active");
});
fav.addEventListener("click", () => {
	fav.classList.toggle("active");
});