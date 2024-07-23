emailValidation(String? value) {
  if (value!.isEmpty) {
    return 'Email field is required';
  }

  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
    return "Please enter a valid email address";
  }

  return null;
}

passwordValidation(String? value) {
  if (value!.isEmpty) {
    return "Password is required";
  } else if (value.length < 6) {
    return "Password cannot be less than 6 characters";
  }
  return null;
}



confirmPasswordValidation(String? password, String? confirmPassword) {
  if (password != confirmPassword) {
    return "Password does not match";
  }
  return null;
}

emptyValidation(String? value) {
  if (value!.isEmpty) {
    return "This field cannot be empty";
  }
  return null;
}

countryValidation(String? value) {
  if (value!.isEmpty) {
    return "Please select a country";
  }
  return null;
}
