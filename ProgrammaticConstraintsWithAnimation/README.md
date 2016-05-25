ProgrammaticConstraintsWithAnimation lets students practice manually creating constraints using NSLayoutConstraints, as well as use animating views.

**Look over the README in the root folder of this repository**

# Suggested breakdown for ProgrammaticConstraintsWithAnimation

1. Show students the final product first so they know what they are working toward and what type of constraints they might need to create.
2. Create a new single view project
3. In ViewController.swift add four UIButtons. One for each color you plan on using.
4. Create a function that will set the background color of the buttons, target actions, and add the buttons as subviews of the view.
5. Create a function that will constrain the height and width of each button.
6. Create a function that will constrain each button to their respective corners and to the surrounding buttons. e.g. The top left button should be constrained to the top and leading of the view, the leading of the top right button, and the top of the bottom left button.
7. Make sure that each of the functions are getting called in the viewDidLoad.
8. For the target action on the buttons, create two functions that will animate the button.
9. One function should animate using ```UIView.animateWithDuration```.
10. The last function should animate using ```CAKeyframeAnimation()```.
