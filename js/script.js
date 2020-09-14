/*** GLOBAL VARIABLES ***/

const buttons = document.getElementById('buttons');
const displayValue = document.getElementById('display-value');
let operand = 0;
let operator = 0;
let firstOperation = true; // Used to determine if we are chaining operations together or this is the first inputting
let inputting = false; // Used to determine if we are currently inputting a number


/*** JQUERY OPENING ANIMATION ***/

$(function() {
    $("#animation").hide(500);
    $("#animation").slideDown(900);
})


/*** BUTTON EVENT LISTENER ***/

buttons.addEventListener('click', (e) => {
    // numbers
    if(e.target.className == 'num') {
        if(inputting == false){
            wipe();
            inputting = true;
        }
        fill(e.target.innerText);
    }
    // operators
    if(e.target.className == 'operator') {
        inputting = false;
        if (firstOperation) {
            operand = +displayValue.innerText;
            operator = e.target.innerText;
            firstOperation = false;
        }
        else {
            operand = operate(operand, operator, +(displayValue.innerText));
            updateDisplay(operand);
            operator = e.target.innerText;
        }
    }
    // clear
    if(e.target.id == 'ac'){
        clear();
    }
    // equals
    if(e.target.id == 'equals'){
        inputting = false;
        operand = operate(operand, operator, +displayValue.innerText);
        updateDisplay(operand);
        firstOperation = true;
    }
    // sign
    if(e.target.id == 'sign'){
        updateDisplay(flipSign(+displayValue.innerText));
    }
    // percent
    if(e.target.id == 'percent'){
        updateDisplay(percent(+displayValue.innerText));
    }
    // decimal
    if(e.target.id == 'decimal'){
        if(decimalUsed(displayValue.innerText)) {}
        else {
            fill(e.target.innerText);
        }
    }
    else {}
})


/*** KEYBOARD EVENT LISTENER ***/

window.addEventListener('keydown', (e) => {
    console.log(e.key);
    const key = document.querySelector(`button[data-key='${e.key}']`);
    key.click();
});


/*** FUNCTIONS ***/

function updateDisplay(a) {
    if(a.toString().length >= 10) {
        a = a.toString().substring(0, 10);
    }
    displayValue.innerText = a;
}

function operate(num1, operator, num2) {
    switch(operator) {
        case '+':
            return num1+num2;
        case '-':
            return num1-num2;
        case 'x':
            return num1*num2;
        case '÷':
            return divide(num1, num2);
    }
    return 0;
}

function divide(a, b) {
    if(b == 0) {
        return "ERROR";
    }
    else {
        return a/b;
    }
}

function flipSign(a) {
    return a *= -1;
}

function percent(a) {
    return a/100;
}

function decimalUsed(a) {
    if(a.includes('.')) {
        return true;
    }
    else {
        return false;
    }
}

function fill(inputting) {
    if(displayValue.innerText.length < 10) {
        displayValue.innerText += inputting;
    }
}

function wipe() {
    displayValue.innerText = '';
}

function clear() {
    operand = 0, operand2 = 0, operator = 0;
    displayValue.innerText = '';
    firstOperation = true; // Allows us to avoid calculation return when hitting operator buttons
}

