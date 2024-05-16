function showError(message) {
    let error = document.getElementsByClassName('errorMessage')[0];
    if (message) {
        error.classList.remove('d-none');
        error.innerHTML = message;
    } else {
        error.classList.add('d-none');
    }
}


function validate() {
    let emailField = document.getElementById('email');
    let passwordField = document.getElementById('pwd');
    let email = emailField.value;
    let password = passwordField.value;
    if (email =='') {
        showError('Please enter your email address');
        return false;
    }
    if (!email.includes('@')) {
        showError('This is not a valid email address');
        return false;
    }
    if (password =='') {
        showError('Please enter your password');
        return false;
    }
    if (password.length < 6) {
        showError('Password must be at least 6 characters long');
        return false;
    }

    showError(null);
    return true;
}

function addStudent() {
    let firstNameField = document.getElementById('firstname');
    let lastNameField = document.getElementById('lastname');
    let emailField = document.getElementById('email');

    let firstName = firstNameField.value;
    let lastName = lastNameField.value;
    let email = emailField.value;

    let tr = document.createElement('tr');
    let td1 = document.createElement('td');
    let td2= document.createElement('td');
    let td3 = document.createElement('td');
    let td4 = document.createElement('td');

    tr.appendChild(td1);
    tr.appendChild(td2);
    tr.appendChild(td3);
    tr.appendChild(td4);

    td1.innerHTML = firstName;
    td2.innerHTML = lastName;
    td3.innerHTML = email;
    td4.innerHTML = '<button onclick="removeStudent(this)" class ="btn btn-danger btn-sm">Delete</button>';

    let tbody = document.getElementsByTagName('tbody')[0];
    tbody.appendChild(tr);

    firstName='';
    lastName='';
    email='';

    firstNameField.focus();
}

function removeStudent(element) {
    let td = element.parentElement;
    let tr = td.parentElement;
    tr.remove()
}

function reset() {
    let tbody = document.querySelector('tbody');
    tbody.innerHTML = '';
}

function updateText(message) {
    console.log('it works')
    let alert = document.getElementsByClassName('alert-success')[0];
    alert.innerHTML = message;
}

function updateColor(color) {
    let alert = document.getElementsByClassName('alert-success')[0];
    console.log(color)
    alert.style.color = color;
}

function changeWeight(isBold) {
    let alert = document.getElementsByClassName('alert-success')[0];
    if (isBold) {
        alert.style.fontWeight = 'bold';
    } else {
        alert.style.fontWeight = 'nomal';
    }
}

function changeStyle(isItalic) {
    let alert = document.getElementsByClassName('alert-success')[0];
    if (isItalic) {
        alert.style.fontStyle = 'italic';
    } else {
        alert.style.fontStyle = 'normal';
        
    }
}

function changeDecoration(isUnderline) {
    let alert = document.getElementsByClassName('alert-success')[0];
    if (isUnderline) {
        alert.style.textDecoration = 'underline';
    } else {
        alert.style.textDecoration = 'none';
    }
}

function restore() {
    let boldCheckbox = document.getElementById('bold');
    let italicCheckbox = document.getElementById('italic');
    let underlineCheckbox = document.getElementById('underline');

    boldCheckbox.checked = false;
    italicCheckbox.checked = false;
    underlineCheckbox.checked = false;

    let alert = document.getElementsByClassName('alert-success')[0];
    alert.style.color = 'Green';
    alert.style.fontWeight = 'normal'; 
    alert.style.fontStyle = 'normal'; 
    alert.style.textDecoration = 'none';
}