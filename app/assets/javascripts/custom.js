var hash = {
  "/users/new": "new-user",
  "/users" : "view-user",
  "/users/:id/edit" : "attendance-report",
  "/generals": "view-general",
  "/companies" : "view-company",
  "/companies/new" : "view-company",
  "/principals" : "view-principal",
  "/families": "view-family",
  "/businesses" : "view-business",
  "/businesses/new" : "view-business",
  "/contacts": "view-contact",
  "/contacts/new": "view-contact",
  "/plans" : "view-plan",
  "/plans/new" : "view-plan",
  "/5500" : "view-5500",
  "/5500/new": "view-5500",
  "/employees" : "view-employee",
  "/employees/new" : "view-employee",
  "/distribution" : "distribution",
  "/my_active_task" : "active-task",
  "/roles" : "view-roles",
  "/roles/new" : "add-role",

  };

  $("tr[data-link]").click(function() {
    window.location = $(this).data("link")
  })

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