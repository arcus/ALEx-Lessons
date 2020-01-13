# Arcus Learning Exchange (ALEx)

#### Designer and agile project owner, Sheila Braun; Proof of Concept, Ian Campbell, MD PhD. Based on ideas formed at the Summer 2019 Arcus Education Retreat attended by Joy Payton and Sheila Braun. Other contributors are Zoë Wilkinson-Saldaña, Patrick Dibussolo, and Lara Lechtenberg, all of the Children's Hospital of Philadelphia (CHOP).

Many of CHOP’s principle investigators and their teams have become interested in expanding their data science skills. In support of [the Arcus project at CHOP](https://arcus.reskubestage.research.chop.edu), one of our goals at [Arcus Education](https://education.arcus.chop.edu) is to create learning events and experiences in which 100% of attendees spend 100% of their time working towards their own goals at their own pace. We have piloted our approach with R and Statistics workshops, Python workshops, and by making lessons freely available to users via the ALEx website. 

In our workshops, 

* Each learner sets their own goals.    
* Each learner receives an individualized curriculum based on their goals.   
* Success is measured by the extent to which each learner perceives themselves to have met their own goals.

Learning event attendees have highly variable goals, from R basics to machine learning algorithms for genetic data to report writing for monthly metrics. We experimented with RStudio's R packages `shiny` and `learnr` to answer the question, “How can an instructor who has _N_ attendees at a workshop create _N_ different curricula based on _N_ different sets of learning goals, while still treating the class not so much as a single entity, but as _N_ individuals?” 

To answer this question in a practical way, we created a tool that streamlines the process of providing individual curricula.

The software for this tool is in the [Personalized Learning Plan](https://github.research.chop.edu/braunsb/Arcus-Education-Lessons-and-Learning-Plan-Generator/tree/master/Personalized-Learning-Plan) folder. Individual lessons are in [Lessons](https://arcus/ALEx-Lessons). 

### Come to a Workshop or to another learning event!

All CHOP and Penn employees are welcome to attend our workshops. Registration is required. [Click here to find out more and to register](http://bit.ly/CHOP-ALEx-Registration). 

### Become a Contributor!

[New Lessons](https://github.research.chop.edu/braunsb/Arcus-Education-Lessons-and-Learning-Plan-Generator/tree/master/New-Lessons) is a folder for you, should you wish to become an ALEx contributor. Please add your educational material to this folder. If you are a genetics expert, teach us about genetics; if you want people to know how to use a package you just created, create a lesson about it and add it. If you want to teach about Python, put your Python lessons there.

NOTE: The New Lessons link works for CHOP employees only at the moment. 

These are our requirements for a lesson:

* Your lesson must be provided in Markdown (.Rmd is our favorite, but you may supply a straight-up .md file instead).
* You may link out from the .md file to anywhere you like on the web---documents or presentations you have in the cloud, for instance. We just need the .Rmd or .md file as a wrapper for whatever else you have going on. 
* Your lesson must adhere to CHOP's standards and ethics. 

Our editors will check your lesson and add it to the list of options available to learners. 

## For Instructors: How to Add a Lesson

Ian Campbell has provided [documentation in a wiki](https://github.com/ianmcampbell/Arcus-Modular-Education-Support-System/wiki). Check it out!

NOTES

* I found out the hard way that adding any other detritus (files, etc.) to the root directory "Lessons" results in the learning plan generator breaking.     
* If your lesson has supporting data, just plunk it into the folder that contains the lesson and use the name of the file alone as pathname from within your lesson document. 
* If what your lesson links to calls supporting data, you may keep that data whereever you like, provided that it is a public link that any leaner-instructor may access even if they don't have CHOP credentials. 

Thank you for adding to the list of lessons we can offer!

### Note about this Repo's History

Related to the repo inside CHOP's enterprise GitHub. 
