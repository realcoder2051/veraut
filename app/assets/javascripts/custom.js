var hash = {
  "/users/new": "add-attendance",
  "/users" : "view-attendance",
  "/users/:id/edit" : "attendance-report",
  "/generals": "view-general",
  "/companies" : "view-company",
  "/principals" : "view-principal",
  "/families": "view-family",
  "/businesses" : "view-business",
  "/contacts": "view-contact",
  "/plans" : "view-plan",
  "/fifty_five_hundreds" : "view-5500",
  "/employees" : "view-employee",
  "/distribution" : "distribution",
  "/my_active_task" : "active-task"
  };


  function sidebar(url){
  if(url != "/welcome" && url != "/"){
    document.getElementById("home").classList.remove("active")
    var item = document.getElementById(hash[url]);
    var li = $(item).parent().parent().addClass("open");
    item.classList.add("active")
  }
  else
  {
    document.getElementById("home").classList.add("active")

  }
}
  $(document).ready((function () {
  sidebar(window.location.pathname);

  }));