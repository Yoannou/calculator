/*** PROGRAM EXECUTION ***/

const buttons = document.getElementById('buttons');
const displayValue = document.getElementById('display-value');
let operand1 = 0;
let operator = 0;
let operand2 = 0;
let currentOperation = false; //Equivilant of looping back to top of program and re-entering first operand from scratch
let decimalUsed = false;

buttons.addEventListener('click', (e) => {
    console.log(e);
    if(e.target.className == 'num') {
        if(!currentOperation){
            refresh(e.target.innerHTML);
        }
        else {
            
        }
    }
    if(e.target.className == 'operator') {
        operand1 = +(displayValue.innerHTML);
        operator = e.target.innerHTML;
        displayValue.innerHTML=(operate(operator, operand1, operand2));
        currentOperation = true;
    }
    if(e.target.id == 'ac'){
        clear();
    }
    else {}
})


/*** FUNCTIONS ***/

function add(a, b) {
    return a+b;
}

function subtract(a, b) {
    return a-b;
}

function multiply(a, b) {
    return a*b;
}

function divide(a, b) {
    if(b == 0) {
        return "Come on man..."
    }
    else {
        return a/b;
    }
}

// When '=' key is pushed
function operate(operator, num1, num2) {
    switch(operator) {
        case '+':
            return add(num1, num2);
        case '-':
            return subtract(num1, num2);
        case '*':
            return multiply(num1, num2);
        case '÷':
            return divide(num1, num2);
    }
    return 0;
}

function refresh(input) {
    displayValue.innerHTML += input;
}

function clear() {
    operand1 = 0, operand2 = 0, operator = 0;
    displayValue.innerText = '';
    currentOperation = false; // Allows us to re-enter first operator from scratch
}


//Make a function for when the user enters an operator and the loop starts of chaining
function loop() {

}