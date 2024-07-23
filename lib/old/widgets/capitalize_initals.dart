String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input; // Return the input unchanged if it's an empty string
  }
  return input[0].toUpperCase() + input.substring(1);
}