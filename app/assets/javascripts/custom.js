var hash = {
    "/attendances": "view-attendance",
     "/attendances/new" : "add-attendance",
     "/attendance_report" : "attendance-report",
     "/leaves": "view-leaves",
     "/leaves/new" : "add-leaves",
     "/leave_report" : "leave-report",
     "/employees": "view-employees",
     "/employees/new" : "add-employees",
     "/holidays": "view-holidays",
     "/holidays/new" : "add-holidays",
     "/edit_status" : "edit-employees"
  }

  function sidebar(url){
    var item = document.getElementById(hash[url]);
    var li = $(item).parent().parent().addClass("open");
    item.classList.add("active")
  }
