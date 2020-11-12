//= require stack/core-scripts
checkSidebarStatus();
$(window).on("load", function() {
  $(".sidebarCollapse").on("click", function() {
    sidebarfun();
  });
  $(".sidebarExpand").on("click", function() {
    sidebarExpand();
  });
});
// Self Initialize DOM Factory Components
domFactory.handler.autoInit();
$("#customCheckAll").click(function() {
  $("input:checkbox")
    .not(this)
    .prop("checked", this.checked);
});
$("select").addClass("form-control");

// Connect button(s) to drawer(s)
var sidebarToggle = Array.prototype.slice.call(
  document.querySelectorAll('[data-toggle="sidebar"]')
);

sidebarToggle.forEach(function(toggle) {
  toggle.addEventListener("click", function(e) {
    var selector =
      e.currentTarget.getAttribute("data-target") || "#default-drawer";
    var drawer = document.querySelector(selector);
    if (drawer) {
      drawer.mdkDrawer.toggle();
    }
  });
});

$(
  ".text-muted, .flex-column, .flex.d-flex.align-items-center.text-body.text-underline-0"
).click(function() {
  $("#dropdown-drawer-left").toggleClass("show");
});
$(
  ".next-options, .flex-column, .flex.d-flex.align-items-center.text-body.text-underline-0"
).click(function() {
  $("#next-options").toggleClass("show");
});

$('[data-toggle="fullcalendar"]').each(function() {
  const element = $(this);
  const options = {
    themeSystem: "bootstrap4",
    closeButton:
      void 0 !== element.data("toastr-close-button")
        ? element.data("toastr-close-button")
        : false,
    slotDuration: "00:15:00",
    minTime: "08:00:00",
    maxTime: "19:00:00",
    defaultView: "month",
    handleWindowResize: true,
    height: $(window).height() - 200,
    header: {
      left: "prev,next today",
      center: "title",
      right: "month,agendaWeek,agendaDay",
    },
    events,
    editable: true,
    droppable: true,
    eventLimit: true,
    selectable: true,
    drop: function(date) {
      onDrop($(this), date, element);
    },
    select: function(start, end, jsEvent) {
      onSelect(start, end, jsEvent, element);
    },
    eventClick: function(event, jsEvent, view) {
      onEventClick(event, jsEvent, view, element);
    },
  };

  element.fullCalendar(options);
});

let drawers = document.querySelectorAll(".mdk-drawer");
drawers = Array.prototype.slice.call(drawers);
drawers.forEach((drawer) => {
  drawer.addEventListener("mdk-drawer-change", (e) => {
    if (!e.target.mdkDrawer) {
      return;
    }
    document
      .querySelector("body")
      .classList[e.target.mdkDrawer.opened ? "add" : "remove"](
        "has-drawer-opened"
      );
    let button = document.querySelector('[data-target="#' + e.target.id + '"]');
    if (button) {
      button.classList[e.target.mdkDrawer.opened ? "add" : "remove"]("active");
    }
  });
});

// SIDEBAR COLLAPSE MENUS
$(".sidebar .collapse").on("show.bs.collapse", function(e) {
  e.stopPropagation();
  var parent =
    $(this)
      .parents(".sidebar-submenu")
      .get(0) ||
    $(this)
      .parents(".sidebar-menu")
      .get(0);
  $(parent)
    .find(".open")
    .find(".collapse")
    .collapse("hide");
  $(this)
    .closest("li")
    .toggleClass("open");
});
$(".sidebar .collapse").on("hidden.bs.collapse", function(e) {
  e.stopPropagation();
  $(this)
    .closest("li")
    .toggleClass("open");
});

function sidebarfun() {
  $("#default-drawer").removeClass("col-3");
  $(".applicationCol").addClass("col-12");
  $(".applicationCol").removeClass("col-10");
  $(".applicationCol").removeClass("application-width");
  $("#default-drawer").removeClass("drawer-width");
  $(".applicationCol").css("padding-left", "100px");
  $(".sidebar-menu-text").addClass("d-none");
  $(".sidebar-menu").addClass('pt-5');
  $("#flex").removeClass('d-flex');
  $("#flex").addClass('d-none');
  $(".sidebar-menu-icon ").css({
    margin: "10px",
  });
  // $(".sidebar-menu-toggle-icon").css({
  //   display: "none",
  // });
  $(".sidebar-menu-toggle-icon").addClass("d-none");
  $(".sidebar-menu-toggle-icon").removeClass("d-block");
  $(".sidebarExpand").attr("style", "display: block !important");
  $(".sidebarCollapse").attr("style", "display: none !important");
  setCookie("sidebar_status", "collapsed", 365);
}
function sidebarExpand() {
  $(".sidebar-menu-text").removeClass("d-none");
  $(".sidebar-menu-toggle-icon").removeClass("d-none");
  $(".sidebar-menu-toggle-icon").addClass("d-block");
  $("#default-drawer").addClass("col-3");
  $(".applicationCol").removeClass("col-12");
  $(".applicationCol").addClass("col-10");
  $(".applicationCol").addClass("application-width");
  $("#default-drawer").addClass("drawer-width");
  $(".applicationCol").css("padding-left", "11px");
  $(".sidebar-menu").removeClass('pt-5');
  $("#flex").addClass('d-flex');
  $("#flex").removeClass('d-none');
  $(".sidebar-menu-icon ").css({
    margin: "5px",
  });
  $(".sidebarExpand").attr("style", "display: none !important");
  $(".sidebarCollapse").attr("style", "display: block !important");
  setCookie("sidebar_status", "expanded", 365);
}

function checkSidebarStatus() {
  var username = getCookie("sidebar_status");

  if (username == "collapsed") {
    sidebarfun();
  }
  else{
    sidebarExpand();
  }
}
// ENABLE TOOLTIPS
$('[data-toggle="tooltip"]').tooltip();

// ENABLE TABS
$('[data-toggle="tab"]').on("hide.bs.tab", function(e) {
  $(e.target).removeClass("active");
});

document.addEventListener("turbolinks:load", function() {
  domFactory.handler.upgradeAll();

  // Connect button(s) to drawer(s)
  var sidebarToggle = Array.prototype.slice.call(
    document.querySelectorAll('[data-toggle="sidebar"]')
  );

  sidebarToggle.forEach(function(toggle) {
    toggle.addEventListener("click", function(e) {
      var selector =
        e.currentTarget.getAttribute("data-target") || "#default-drawer";
      var drawer = document.querySelector(selector);
      if (drawer) {
        drawer.mdkDrawer.toggle();
      }
    });
  });

  // DRAG AND DROP
  $('[data-toggle="dragula"]').each(function() {
    var element = $(this);
    var options = {
      moves: function(el, source, handle, sibling) {
        return void 0 !== element.data("dragula-moves")
          ? handle.classList.contains(element.data("dragula-moves"))
          : true;
      },
    };

    var containers = $(this).data("dragula-containers");
    var elements = [];

    if (containers) {
      for (var i = 0; i < containers.length; i++) {
        elements.push(document.querySelector(containers[i]));
      }
    } else {
      elements.push(element[0]);
    }

    dragula(elements, options);
  });
  // END

  $('[data-toggle="fullcalendar"]').each(function() {
    const element = $(this);
    const options = {
      themeSystem: "bootstrap4",
      closeButton:
        void 0 !== element.data("toastr-close-button")
          ? element.data("toastr-close-button")
          : false,
      slotDuration: "00:15:00",
      minTime: "08:00:00",
      maxTime: "19:00:00",
      defaultView: "month",
      handleWindowResize: true,
      height: $(window).height() - 200,
      header: {
        left: "prev,next today",
        center: "title",
        right: "month,agendaWeek,agendaDay",
      },
      events,
      editable: true,
      droppable: true,
      eventLimit: true,
      selectable: true,
      drop: function(date) {
        onDrop($(this), date, element);
      },
      select: function(start, end, jsEvent) {
        onSelect(start, end, jsEvent, element);
      },
      eventClick: function(event, jsEvent, view) {
        onEventClick(event, jsEvent, view, element);
      },
    };

    element.fullCalendar(options);
  });

  // DATERANGE

  $('[data-toggle="daterangepicker"]').each(function() {
    const element = $(this);
    const format =
      void 0 !== element.data("daterangepicker-locale-format")
        ? element.data("daterangepicker-locale-format")
        : "YYYY/MM/DD";

    const ranges = {
      Today: [moment(), moment()],
      Yesterday: [moment().subtract(1, "days"), moment().subtract(1, "days")],
      "Last 7 Days": [moment().subtract(6, "days"), moment()],
      "Last 30 Days": [moment().subtract(29, "days"), moment()],
      "This Month": [moment().startOf("month"), moment().endOf("month")],
      "Last Month": [
        moment()
          .subtract(1, "month")
          .startOf("month"),
        moment()
          .subtract(1, "month")
          .endOf("month"),
      ],
    };

    const options = {
      showDropdowns:
        void 0 !== element.data("daterangepicker-show-dropdowns")
          ? element.data("daterangepicker-show-dropdowns")
          : false,
      drops:
        void 0 !== element.data("daterangepicker-drops")
          ? element.data("daterangepicker-drops")
          : "down",
      opens:
        void 0 !== element.data("daterangepicker-opens")
          ? element.data("daterangepicker-opens")
          : "right",
      startDate:
        void 0 !== element.data("daterangepicker-start-date")
          ? element.data("daterangepicker-start-date")
          : moment(),
      endDate:
        void 0 !== element.data("daterangepicker-end-date")
          ? element.data("daterangepicker-end-date")
          : moment().add(1, "month"),
      singleDatePicker:
        void 0 !== element.data("daterangepicker-single-date-picker")
          ? element.data("daterangepicker-single-date-picker")
          : false,
      autoApply:
        void 0 !== element.data("daterangepicker-auto-apply")
          ? element.data("daterangepicker-auto-apply")
          : true,
      timePicker:
        void 0 !== element.data("daterangepicker-time-picker")
          ? element.data("daterangepicker-time-picker")
          : false,
      timePicker24Hour:
        void 0 !== element.data("daterangepicker-time-picker-24-hour")
          ? element.data("daterangepicker-time-picker-24-hour")
          : false,
      ranges:
        void 0 !== element.data("daterangepicker-ranges") ? ranges : false,
      locale: {
        format,
        separator:
          void 0 !== element.data("daterangepicker-locale-separator")
            ? element.data("daterangepicker-locale-separator")
            : " to ",
      },
    };

    element.daterangepicker(options);
  });

  // LISTS

  $('[data-toggle="lists"]').each(function() {
    var element = $(this);
    var options = {
      valueNames:
        void 0 !== element.data("lists-values")
          ? element.data("lists-values")
          : [],
      listClass:
        void 0 !== element.data("lists-class")
          ? element.data("lists-class")
          : "list",
    };

    var listElement = element.get(0);
    var list = new List(listElement, options);

    Object.defineProperty(listElement, "List", {
      configurable: true,
      writable: false,
      value: list,
    });
  });

  // VECTOR

  $('[data-toggle="vector-map"]').each(function() {
    var element = $(this);
    var values = element.data("vector-map-values")
      ? maps[element.data("vector-map-values")] || {}
      : {};
    let pins = {};

    try {
      pins = element.data("vector-map-pins");
      for (var key in pins) {
        if (pins.hasOwnProperty(key)) {
          pins[key] = escapeXml(pins[key]);
        }
      }
    } catch (e) {}

    var options = {
      map: element.data("vector-map-map"),
      zoomOnScroll:
        void 0 !== element.data("vector-map-zoom-on-scroll")
          ? element.data("vector-map-zoom-on-scroll")
          : false,
      enableZoom:
        void 0 !== element.data("vector-map-enable-zoom")
          ? element.data("vector-map-enable-zoom")
          : false,
      showTooltip:
        void 0 !== element.data("vector-map-show-tooltip")
          ? element.data("vector-map-show-tooltip")
          : true,
      focusOnSelect:
        void 0 !== element.data("vector-map-focus-on-select")
          ? element.data("vector-map-focus-on-select")
          : false,
      backgroundColor:
        void 0 !== element.data("vector-map-background-color")
          ? element.data("vector-map-background-color")
          : "transparent",
      values,
      color: settings.colors.gray[50],
      selectedColor: settings.colors.primary[300],
      hoverColor: settings.colors.primary[100],
      scaleColors: [settings.colors.primary[50], settings.colors.primary[500]],
      borderWidth: 1,
      borderColor: "#ffffff",
      borderOpacity: 1,
      normalizeFunction: "polynomial",
      colors: {},
      pins,
      pinMode: "content",
      onLabelShow: function(e, label, code) {
        label.html(label.html() + " - " + values[code]);
      },
      onRegionSelect: function(event, code, region) {
        if (options.focusOnSelect) {
          map.setFocus(code);
        }
      },
    };

    var colors = element.data("vector-map-values-colors");
    if (colors) {
      for (var key in values) {
        if (values.hasOwnProperty(key) && colors[values[key]] !== undefined) {
          const color = colors[values[key]];
          options.colors[key] = settings.colors.get(color) || color;
        }
      }
    }

    element.vectorMap(options);

    const map = $(this).data().mapObject;

    if (Object.keys(options.colors)) {
      map.setColors(options.colors);
    }

    const scale = element.data("vector-map-scale");
    const focus = element.data("vector-map-focus");

    if (scale) {
      map.setScale(scale);
      map.positionPins();
    } else if (focus) {
      map.setFocus(focus);
    }
  });

  $("[data-toggle=vector-map-focus]").on("click", function(e) {
    e.preventDefault();

    const element = $(this);
    const target = $(element.data("target"));
    if (!target) {
      return;
    }

    const map = target.data().mapObject;
    const focus = element.data("focus");
    const animate = element.data("animate");

    if (focus) {
      map.setFocus(focus, animate);
    }
  });
});

function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + exdays * 24 * 60 * 60 * 1000);
  var expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(";");
  for (var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}
$("#dropdownMenuOpen").on("click", function () {
  $(".dropdown").slideToggle('fast');
});

$(document).on("click", function () {
  $(".dropdown").hide();

});

$("#dropdownMenuOpen").on("click", function (event) {
  event.stopPropagation();
});

$(".tasktable").on("click", function () {
  $(".tasktablebody").toggle();
  $("#collaspse-icon").toggleClass('fa-caret-down');
  $("#collaspse-icon").toggleClass('fa-caret-right')
});

$(".tasktable2").on("click", function () {
  $(".plantable").toggle();
  $("#collaspse-icon1").toggleClass('fa-caret-down');
  $("#collaspse-icon1").toggleClass('fa-caret-right')
});
