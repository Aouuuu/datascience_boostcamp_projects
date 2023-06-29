The project provided is an implementation of an AirBot in R. The AirBot is designed to assist customers with flight bookings through a series of prompts and interactions. Here is a summary of the techniques used in the code:

While Loop: The code utilizes a while (TRUE) loop to continuously prompt the user for input until they choose to exit the bot.

User Input: The readline() function is used to capture user input. The bot asks for the user's request and validates the input to determine the appropriate action.

Conditional Statements: The code uses conditional statements (if, else if, and else) to handle different user requests and execute corresponding actions based on the input.

String Manipulation: The grepl() function is used to validate the format of user input, such as checking if a date string matches the specified format or if a booking number follows a specific pattern.

Data Validation: The code validates the user's input against predefined criteria, such as checking if the origin, destination, or package class entered by the user is valid.

Output: The print() function is used to display messages to the user at different stages of the interaction, providing confirmation of choices, booking details, cancellation notices, and upgrade information.

Termination: The code provides an option for the user to exit the bot by typing "exit." The break statement is used to terminate the while loop and end the program.

Overall, the AirBot uses user input, conditional statements, and string manipulation techniques to simulate a conversational interface for booking flights, canceling flights, and upgrading flight packages.

Please visit Datalore(https://datalore.jetbrains.com/notebook/cizxdJHX4pwAETi2Qk5aNH/mqsVuVQm1fNRTmDqmUDpd0) to try.
  
Airbot <- function() {
  # Introduction
  print("----------------")
  print("## Instruction: This AirBot is designed to answer a simple question for a customer that wants to book a flight")
  print("## Key: Type 'exit' if you wish to terminate the bot or contact the call center")
  print("----------------")
  print("Hello, I'm AirBot. Here are three functions that I can assist you with: 'book flight', 'cancel flight', 'upgrade flight'")
  
  while (TRUE) {
    # Ask user for input
    request <- readline("How can I assist you with your booking today? ('book flight', 'cancel flight', 'upgrade flight') | Reply: ")
    
    if (request == "exit") {
      # If user types 'exit', terminate the bot
      print("Thank you for your time. Hope to see you again!")
      break
    } else if (request == "book flight") {
      # If user requests to book a flight, prompt for flight details
      origin_country <- readline("What is your origin country? (Countries available: THA, SIN, JPN) | Reply: ") 
      if (origin_country %in% c("THA", "SIN", "JPN")) {
        print(paste("Confirm origin: ", origin_country))
        destination_country <- readline("What is your destination country? (Countries available: THA, SIN, JPN) | Reply: ")
        if (destination_country %in% c("THA", "SIN", "JPN")) {
          print(paste("Confirm destination: ", destination_country))
          depart_date <- readline("What is your booking depart date? (YYYY-MM-DD) | Reply: ")
          if (grepl("\\d{4}-\\d{2}-\\d{2}", depart_date)) {
            arrive_date <- readline("What is your booking arrive date? (YYYY-MM-DD) | Reply: ")
            if (grepl("\\d{4}-\\d{2}-\\d{2}", arrive_date)) {
              # If flight details are valid, book the flight and terminate the bot
              print(paste("I've booked a flight from: ", origin_country, "to", destination_country, "on", depart_date,"to",arrive_date))
              print("Have a nice trip!")
              break
            } else {
               # If arrive date is invalid, prompt user to try again
              print("Invalid date format. Please try again.")
            }
          } else {
             # If depart date is invalid, prompt user to try again
            print("Invalid date format. Please try again.")
          }
        } else {
          # If destination country is invalid, prompt user to try again
          print("Invalid destination country. Please try again.")
        }
      } else {
        # If origin country is invalid, prompt user to try again
        print("Invalid origin country. Please try again.")
      }
    } else if (request == "cancel flight") {
      # If user requests to cancel a flight, prompt for booking number
      booking_number <- readline("What is your booking number? (Example: ABC123) | Reply: ")
      if (grepl("[A-Za-z]{3}\\d{3}", booking_number)) {
        # If booking number is valid, cancel the flight and terminate the bot 
        print(paste("Sorry to hear that, I've cancelled your booking number: ", booking_number))
        print("Thank you for your time. Hope to see you again!")
        break
      } else {
        # If booking number is invalid, prompt user to try again
        print("Invalid booking format. Please try again.")
      }
    } else if (request == "upgrade flight") {
      # If user requests to upgrade a flight, prompt package details
      current_package <- readline("What is your current package class? (Economy, Business, First) | Reply: ")
      print(paste("Current package class: ", current_package))
      upgrade_package <- readline("What class do you want to upgrade to? (Economy, Business, First) | Reply: ")
      if (upgrade_package %in% c("Economy", "Business", "First")) {
        # If package name is valid, upgrade the flight and terminate the bot
        print(paste("I've updated your package class from", current_package, "to", upgrade_package))
        print("Have a nice trip!")
        break
      } else {
        # If package name is invalid, prompt user to try again
        print("Invalid package class. Please try again.")
      }
    } else {
      # If user input invalid request, prompt user to try again
      print("Invalid request. Please try again.")
    }
  }
}

Airbot()
