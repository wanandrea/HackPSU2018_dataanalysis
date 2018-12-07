# HackPSU2018 Data Analysis

Responsibilities: AngularJS, Web UI Design, Data Visualization, Marketing Solution

Research & Design Process
1. Identified the key problem, opportunity, and target audience
2. Created data visualization answer

In January 2018, I joined the Technology Team for HackPSU(https://hackpsu.org/), one of the largest all student organized hackathon. The team works on new services to provide a better experience for attendees, including using Amazon Web Services web hosting for a new administrative portal, switching to a continuous integration system for industry-like code review, and an RFID tracking system to replace the QR tracker used in the past. I specialized in  visualizing the data being collected before, during and after the event for internal and external analytic use.

I encountered three opportunities to find meaning statistics from visualization. It included from finding registration pattern, understand logistics statistics, and profile analysis of final submission attendees. All the opportunities work towards the mission, “Learn, build, share.” 

This respository is designed for the third opportunity: profile analysis of final submission attendees

#Goal:
The project aims to attract more students to attend the event and most importantly submit a project. 

#Problem: 
Although there are over 800 attendees for the most recent hackathon, the submission is only 10% of the total participation. The interactive tool currently demonstrates partial profile of attendees and is under further investigation to find an effective method to impove submission rate. 

#Target Audience:
Major League Hacking and executive board of HackPSU 

#R Shiny
Shiny is a new package from RStudio that makes it incredibly easy to build interactive web applications with R.

For an introduction and examples, visit the Shiny Dev Center.

If you have general questions about using Shiny, please use the RStudio Community website. For bug reports, please use the issue tracker.
http://shiny.rstudio.com
https://github.com/rstudio/shiny

#App Design:
I designed shiny app that includes varies charts, visually telling the story of who these participants are.

The tool is written using only R, the statistics programming language, and its user interface tool, Shiny App. 
#Pie Chart: it shows the proportion of students academic year, gender and coding experience. A pie chart gives a clear demonstration of these categorical data with slightly varies color under the same color scheme. 
#Lollipop Chart: Lollipop charts conveys a similar information as bar charts, but it gives a modern taste. I decided to use it for majors of these students due to long major names. 
#Dot Plot: Dot plot is similar to lollipops and I found it to be a fun experiment to try it out with race data. It emphasizes the race that has the highest participation and ranked the rest. A bar chart would have a similar effect, but I wanted to try an unconventional graph. 

