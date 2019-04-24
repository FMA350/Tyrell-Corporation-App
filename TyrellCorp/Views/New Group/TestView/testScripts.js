let remainingTime;
let loop_handle;
let score =0;

function startTest(){
// set timer for 15 sec per question
    remainingTime = 15;
    $("#introduction").css("display", "none");
    $("#question1").css("display", "block");
    loop_handle = setInterval(function(){
        remainingTime -= 0.1;
        $(".timer").text(remainingTime.toFixed(2));
        if(remainingTime < 5){
            $(".timer").addClass("important");
        }
        if(remainingTime < 0){
            let win = window.open('https://www.youtube.com/watch?v=ARPCjp0ppEE', '_blank');
            alert("I have seen things, you people wouldn't believe...");
            clearInterval(loop_handle);
        }
    },100);
}


function question1(answer){
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
    remainingTime= 15;
    $("#question1").css("display", "none");
    $("#question2").css("display", "block");
    loop_handle = setInterval(function(){
        remainingTime -= 0.1;
        $(".timer").text(remainingTime.toFixed(2));
        if(remainingTime < 5){
            $(".timer").addClass("important");
        }
        if(remainingTime < 0){
            let win = window.open('https://www.youtube.com/watch?v=ARPCjp0ppEE', '_blank');
            alert("I have seen things, you people wouldn't believe...");
            clearInterval(loop_handle);
        }
    },100);
}

function question2(answer){
    if(answer == "1"){
        score += 0.8;
    }
    else if(answer=="2"){
        score += 0;
    }
    else if(answer=="3"){
        score += 1;
    }
    $("#question2").css("display", "none");
    $("#question3").css("display", "block");
    clearInterval(loop_handle);
    remainingTime= 15;
    loop_handle = setInterval(function(){
        remainingTime -= 0.1;
        $(".timer").text(remainingTime.toFixed(2));
        if(remainingTime < 5){
            $(".timer").addClass("important");
        }
        if(remainingTime < 0){
            let win = window.open('https://www.youtube.com/watch?v=ARPCjp0ppEE', '_blank');
            alert("I have seen things, you people wouldn't believe...");
            clearInterval(loop_handle);
        }
    },100);
}

function question3(answer){
    if(answer == "1"){
        score += 0.8;
    }
    else if(answer=="2"){
        score += 0.2;
    }
    else if(answer=="3"){
        score += 0;
    }
    $("#question3").css("display", "none");
    $("#question4").css("display", "block");
    clearInterval(loop_handle);
    remainingTime= 15;
    loop_handle = setInterval(function(){
        remainingTime -= 0.1;
        $(".timer").text(remainingTime.toFixed(2));
        if(remainingTime < 5){
            $(".timer").addClass("important");
        }
        if(remainingTime < 0){
            let win = window.open('https://www.youtube.com/watch?v=ARPCjp0ppEE', '_blank');
            alert("I have seen things, you people wouldn't believe...");
            clearInterval(loop_handle);
        }
    },100);
}

function question4(answer){
    clearInterval(loop_handle);
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
    $("#resultPercent").text(answer/4);
    if(answer/4 > 0.7){
        $("#resultDescription").text("You are a replicant!");
    }
    else if(answer/4 > 0.3){
        $("#resultDescription").text("You might be replicant, or just a strange person");
    }
    else{
        $("#resultDescription").text("Totally human! Welcome aboard!");

    }
}
