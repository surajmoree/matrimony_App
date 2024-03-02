import '../variables.dart';

bool isDOBValid()
{
  if(dateController.text.isEmpty || monthController.text.isEmpty || yearController.text.isEmpty)
  {
    return false;
  }

  // Check if all values are numeric
    if (!RegExp(r'^[0-9]*$').hasMatch(dateController.text) ||
      !RegExp(r'^[0-9]*$').hasMatch(monthController.text) ||
      !RegExp(r'^[0-9]*$').hasMatch(yearController.text)) {
    return false;
  }

    // Parse values to integers

    int day = int.tryParse(dateController.text) ?? 0;
    int month = int.tryParse(monthController.text)?? 0;
    int year = int.tryParse(yearController.text) ?? 0;

      // Check if the entered date is a valid date
      if(day < 1 || day > 31 || month < 1 || month > 12)
      {
         return false;
      }

        // Check for months with less than 31 days

        if((month == 4 || month == 6 || month == 9 || month == 11) && day>30)
        {
          return false;
        }

          // Check for February and leap years

          if(month == 2)
          {
            if((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
            {
              return false;
            }
            else {
      if (day > 28) {
        return false;
      }
    }

          }

      return true;





}