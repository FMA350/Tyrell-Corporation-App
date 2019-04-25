let remainingTime;
let loop_handle;
let currentQuestion = 1
let score = 0;


function clockHandler(){
    remainingTime -= 0.1;
    $(".timer").text(remainingTime.toFixed(2));
    if(remainingTime < 5){
        $(".timer").addClass("important");
    }
    if(remainingTime < 0){
        nextQuestion()
    }
}

function nextQuestion(){
    switch (currentQuestion) {
        case 1: question1(3);
            break;
        case 2: question2(3);
                break;
        case 3: question3(1)
                break;
        case 4: question4(3)
                break;
        default:
                break


    }
}

function startTest(){
    remainingTime = 15;
    $("#introduction").css("display", "none");
    $("#question1").css("display", "block");
    loop_handle = setInterval(clockHandler, 100);
}


function question1(answer){
    $(".timer").removeClass("important");
    $("#question1").css("display", "none");
    $("#question2").css("display", "block");
    currentQuestion = 2
    if(answer == "1"){
        score += 0.3;
    }
    else if(answer=="2"){
        score += 0;
    }
    else if(answer=="3"){
        score += 1;
    }
    clearInterval(loop_handle);
    remainingTime = 25;
    loop_handle = setInterval(clockHandler,100);
}

function question2(answer){
    $(".timer").removeClass("important");
    $("#question2").css("display", "none");
    $("#question3").css("display", "block");
    currentQuestion = 3
    if(answer == "1"){
        score += 0.8;
    }
    else if(answer=="2"){
        score += 0;
    }
    else if(answer=="3"){
        score += 1;
    }
    clearInterval(loop_handle);
    remainingTime= 18;
    loop_handle = setInterval(clockHandler, 100);
}

function question3(answer){
    $(".timer").removeClass("important");
    $("#question3").css("display", "none");
    $("#question4").css("display", "block");
    currentQuestion = 4

    if(answer == "1"){
        score += 0.8;
    }
    else if(answer=="2"){
        score += 0.2;
    }
    else if(answer=="3"){
        score += 0;
    }

    clearInterval(loop_handle);
    remainingTime= 15;
    loop_handle = setInterval(clockHandler, 100);
}

function question4(answer){
    clearInterval(loop_handle);
    $(".timer").removeClass("important");
    if(answer == "1"){
        score += 0;
    }
    else if(answer=="2"){
        score += 0.3;
    }
    else if(answer=="3"){
        score += 1;
    }

    $("#question4").css("display", "none");
    $("#result").css("display", "block");
    //divide score by the number of questions
    score /= 4
    $("#resultPercent").text(score);

    if(score > 0.7){
        $("#resultDescription").text("$%@24;; SYSTEM ALERT: UNAUTHORIZED CORPORATE ACCESS; SYSTEM ALERT: REPLICANT USAGE DETECTED %$@24;;");
    }
    else if(score > 0.3){
        $("#resultDescription").text("The test was unable unconclusive. Please run it again or visit the Tyrell Corporate headquarter for an interview with one of our specialists.");
    }
    else{
        $("#resultDescription").text("The test was successful, thank you for taking part in our program.  ##ACCESS GRANTED##");
    }
}

function returnToApp(){
    window.webkit.messageHandlers.sendResult.postMessage({score: score})
}
