
all = document.querySelector(".profile-option-item.all");
fav = document.querySelector(".profile-option-item.fav");
profile_item_all=document.querySelectorAll(".profile.profile-all");
profile_item_fav=document.querySelectorAll(".profile.profile-fav");
console.log(profile_item_all);
console.log(profile_item_fav);

test=document.querySelector(".test");
all.addEventListener("click", () => {
	all.classList.toggle('active');
	fav.classList.toggle('active');
	profile_item_all.forEach(element => {
		element.classList.toggle('active-rev');
	});
	profile_item_fav.forEach(element => {
		element.classList.toggle('active-rev');
		console.log(element);
	});
});

fav.addEventListener("click", () => {
	fav.classList.toggle('active');
	all.classList.toggle('active');
	profile_item_all.forEach(element => {
		element.classList.toggle('active-rev');
	});
	profile_item_fav.forEach(element => {
		element.classList.toggle('active-rev');
		console.log(element);
	});
});
