# Name Greeting!
# Create a function that takes a name and returns a greeting in the form of a string.
# Examples:
#   hello_name("Gerald") ➞ "Hello Gerald!"
#   hello_name("Tiffany") ➞ "Hello Tiffany!"
#   hello_name("Ed") ➞ "Hello Ed!"
# Notes:
#   The input is always a name (as string).
#   Don't forget the exclamation mark!

def hello_name(hname):
    #print("Hello ",hname,"!")
    print(("Hello {}!!").format(hname))

yourname = input("Enter your name:")
hello_name(yourname)