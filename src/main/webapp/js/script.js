// Login form validation
function validateLoginForm() {
    const username = document.forms["loginForm"]["username"].value.trim();
    const password = document.forms["loginForm"]["password"].value.trim();

    if (username.length < 4) {
        Swal.fire({
            icon: "warning",
            title: "Validation Error",
            text: "Username must be at least 4 characters."
        });
        return false;
    }
    if (password.length < 6) {
        Swal.fire({
            icon: "warning",
            title: "Validation Error",
            text: "Password must be at least 6 characters."
        });
        return false;
    }
    return true;
}

// Complaint form validation
function validateComplaintForm() {
    const title = document.forms["complaintForm"]["title"].value.trim();
    const description = document.forms["complaintForm"]["description"].value.trim();

    if (title.length < 5) {
        Swal.fire({
            icon: "warning",
            title: "Validation Error",
            text: "Title must be at least 5 characters."
        });
        return false;
    }
    if (title.length > 100) {
        Swal.fire({
            icon: "warning",
            title: "Validation Error",
            text: "Title cannot exceed 100 characters."
        });
        return false;
    }
    if (description.length < 10) {
        Swal.fire({
            icon: "warning",
            title: "Validation Error",
            text: "Description must be at least 10 characters."
        });
        return false;
    }
    if (description.length > 500) {
        Swal.fire({
            icon: "warning",
            title: "Validation Error",
            text: "Description cannot exceed 500 characters."
        });
        return false;
    }
    return true;
}

// Signup form validation
function validateSignupForm() {
    const fullname = document.forms["signupForm"]["fullname"].value.trim();
    const username = document.forms["signupForm"]["username"].value.trim();
    const password = document.forms["signupForm"]["password"].value;
    const confirmPassword = document.forms["signupForm"]["confirmPassword"].value;
    const role = document.forms["signupForm"]["role"].value;

    if (fullname.length < 3) {
        Swal.fire({
            icon: "warning",
            title: "Validation Error",
            text: "Full Name must be at least 3 characters."
        });
        return false;
    }
    if (username.length < 4) {
        Swal.fire({
            icon: "warning",
            title: "Validation Error",
            text: "Username must be at least 4 characters."
        });
        return false;
    }
    if (password.length < 6) {
        Swal.fire({
            icon: "warning",
            title: "Validation Error",
            text: "Password must be at least 6 characters."
        });
        return false;
    }
    if (password !== confirmPassword) {
        Swal.fire({
            icon: "warning",
            title: "Validation Error",
            text: "Passwords do not match."
        });
        return false;
    }
    if (!role) {
        Swal.fire({
            icon: "warning",
            title: "Validation Error",
            text: "Please select a role."
        });
        return false;
    }
    return true;
}