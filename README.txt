This README file is specifically for instructors who would like to use this course for their own class.

For further information on installing this for your own course and tracking their progress, please see:
- https://github.com/seankross/Google_Forms_Course
- https://swirlstats.com/swirlify/sharing.html
- Walkthrough of Google Forms https://github.com/seankross/Google_Forms_Course install_course_github("seankross", "Google_Forms_Course")

However, we also have tried to write out instructions that should work for any individual.

1. Create a Github account at https://github.com/.
2. Go to our GitHub Page - https://github.com/krcarriere/PSYCH .
3. At the top right, there is a button that says Fork. Click that button.

4.  In each lesson, there is a customTests.R file. Inside each is a google form link. This is how the lesson directs to our Google Forms. We have created one per lesson.
5. Go to your own Google Drive. Create a folder (for organization purposes).
6. Create a form. The first question should be a text-based entry question. Rename the form for the Module you are creating the form for.
7. At the top right of this form, the three dots for more choices includes a "Get pre-filled link". Click that.
8. Type something memorable into the text entry box.
9. Click "Get Link".
10. Click "Copy Link."
11. Go to the customTests.R file and change the pre_filled_link <- " " to what you have.
12. At the end of the URL, you should see what you wrote - DELETE THAT PIECE (it should go =SomethingMemorable". Delete the equal and everything past that.
13. Repeat this process for each course.
14. Have your students install and load the swirl library (install.packages("swirl") library(swirl)
15. Use install_course_github() where you instruct them to pass two arguments - your username and the course name. So, for us, that would be install_course_github("kcarriere", "PSYCH")


Once you have completed these steps, follow the steps of http://swirlstats.com/swirlify/sharing.html to create a new .swc . (You'll need the swirlify package). Push the form changes + the new .swc to your fork of this repo.

Now, have students install_course_github("yourgitname", "Psychology_Statistics").