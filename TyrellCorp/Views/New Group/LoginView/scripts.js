

function login(){
    let email = $("input[name='signinEmail']").val();
    let password = $("input[name='signinPassword']").val();
    window.webkit.messageHandlers.signin.postMessage({email: email, password: password})
}



function signup(){

    let email =     $("input[name='signupEmail']").val();
    let password1 = $("input[name='signupPassword1']").val();
    let password2 = $("input[name='signupPassword2']").val();
    if(password1 != password2 || password1.length < 1){
        alert("Passwords do not match!")
    }
    else{
        window.webkit.messageHandlers.signup.postMessage({email: email, password: password1})
    }
}

function toggleMenu(el){
    $("#triangle-up").toggleClass("turn");
    setTimeout(function () {
               $('#login').toggleClass("visible")
               $('#signup').toggleClass("visible")
               }, 500);
}
