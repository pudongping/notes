var gitbook = window.gitbook;
var options;
var imgUrls;
var time;
gitbook.events.bind('start', function (e, config){
    // Save config data
    options = config['change_girls'] || {};
    imgUrls = options.urls;
    time = options.time || 5;
    imgUrls.push()
});
var id;
gitbook.events.bind("page.change", function (){
    var index = randomInt(0, imgUrls.length - 1);
    clearInterval(id);
    $("<div>").addClass("girls").prependTo($(".book-body"));

    $(".girls").css("backgroundImage", "url(" + imgUrls[index] + ")");
    id = setInterval(function (){
        index = randomInt(0, imgUrls.length - 1);
        $(".girls").css("backgroundImage", "url(" + imgUrls[index] + ")");
    }, time * 1000);
});

function randomInt(from, to) {
    return parseInt(Math.random() * (to - from + 1) + from);
}