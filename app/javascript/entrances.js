// $(".btn btn--stripe").tilt({ scale: 1.1, speed: 1000 });

// click event
$(".btn btn--stripe").on("click", function (e) {
  explode(e.pageX, e.pageY);
});

document.addEventListener("touchstart", function () {}, true);

// symbols
function explode(x, y) {
  var symbolArray = [
    "#donut",
    "#circle",
    "#tri_hollow",
    "#triangle",
    "#square",
    "#squ_hollow",
  ];

  var particles = 10,
    explosion = $(".Button-wrapper");

  for (var i = 0; i < particles; i++) {
    var randomSymbol = Math.floor(Math.random() * symbolArray.length);
    // positioning x,y of the particles
    var x =
        explosion.width() / 2 +
        rand(80, 150) *
          Math.cos((2 * Math.PI * i) / rand(particles - 10, particles + 10)),
      y =
        explosion.height() / 2 +
        rand(80, 150) *
          Math.sin((2 * Math.PI * i) / rand(particles - 10, particles + 10)),
      deg = rand(0, 360) + "deg",
      scale = rand(0.5, 1.1),
      // particle element creation
      elm = $(
        '<svg class="Symbol" style="top:' +
          y +
          "px; left:" +
          x +
          "px; transform: scale(" +
          scale +
          ") rotate(" +
          deg +
          ');">' +
          '<use xlink:href="' +
          symbolArray[randomSymbol] +
          '" />' +
          "</svg>"
      );

    if (i == 0) {
      // only need to target one of the symbols.
      // css3 animation end detection
      elm.one(
        "webkitAnimationEnd oanimationend msAnimationEnd animationend",
        function (e) {
          elm.siblings("svg").remove().end().remove(); // remove particles when animation is over.
        }
      );
    }
    explosion.prepend(elm);
  }
}

function rand(min, max) {
  return Math.floor(Math.random() * (max + 1)) + min;
}

$(function () {
  $('#openModal').click(function(){
    $('#modalArea').fadeIn();
  });
  $('#closeModal , #modalBg').click(function(){
    $('#modalArea').fadeOut();
  });

});
