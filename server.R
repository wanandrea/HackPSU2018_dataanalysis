#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(ggplot2)
library(scales)
library(shiny)
data=read.csv('/Users/andreawan/hackpsu2018/submission.csv', header = TRUE)
df = subset(data, select = -c(user_uid, firstname, lastname,veteran, location_name, event_title, email, phone, class_name, X, scan_time,event_start_time,event_end_time, event_type))
#sum = is.atomic(data.frame(summary(df)))$head[ c("event_type", "gender", "referral", "resume","shirt_size", "academic_year", "allergies","coding_experience", "dietary_restriction","major","travel_reimbursement","registration_time","university","race","project","expectations")] )

server<-shinyServer(function(input, output, session) {
  filedata <- reactive({
    # Haven't tested that this will read in data correctly;
    # assuming it does
    infile <- input$select
    if (is.null(infile)) {
      return(NULL)
    }
    myDF <- fread(infile$datapath)
    return(myDF)
  })
  
  academic_year <- reactive({
    #pie for academic year
    academic_year = data.frame(summary(df$academic_year))
    Academic_year <- data.frame(
      group = c("freshman", "graduate", "junior","other","senior","sophomore"),
      value = academic_year$summary.df.academic_year.
    )
    # Barplot
    bp<- ggplot(Academic_year, aes(x="", y=value, fill=group))+
      geom_bar(width = 1, stat = "identity")
    year_pie <-(bp + coord_polar("y", start=0)) + scale_fill_brewer(palette="Reds")+
      theme_minimal()
    year_pie
  })
  
  gender <- reactive({
    #Pie for gender
    gender = data.frame(summary(df$gender))
    Gender <- data.frame(
      group = c("Male", "Female", "non-disclose"),
      value = gender$summary.df.gender.
    )
    # Barplot
    bp<- ggplot(Gender, aes(x="", y=value, fill=group))+
      geom_bar(width = 1, stat = "identity")
    gender_pie <-(bp + coord_polar("y", start=0)) + scale_fill_brewer(palette="Blues")+
      theme_minimal()
    gender_pie
  })
  
  major <- reactive({
    #pie for major
    theme_set(theme_bw())
    major = data.frame(summary(df$major))
    Major <- data.frame(
      major = c(rownames(major)),
      value = major$summary.df.major.
    )
    # Plot
    major_plot<- ggplot(Major, aes(x=major, y=value)) + 
      geom_point(size=3) + 
      geom_segment(aes(x=major, 
                       xend=major, 
                       y=0, 
                       yend=value)) + 
      labs(title="try", 
           subtitle="hi", 
           caption="sup") + 
      theme(axis.text.x = element_text(angle=65, vjust=0.6))
    major_plot
  })
  
  coding_experience <- reactive({
    coding_experience = data.frame(summary(df$coding_experience))
    Coding_experience <- data.frame(
      group = c(rownames(coding_experience)),
      value = coding_experience$summary.df.coding_experience.
    )
    # Barplot
    bp<- ggplot(Coding_experience, aes(x="", y=value, fill=group))+
      geom_bar(width = 1, stat = "identity")
    coding_pie <-(bp + coord_polar("y", start=0)) + scale_fill_brewer(palette="Purples")+
      theme_minimal()
    coding_pie
  })
  
  race <- reactive({
  race = data.frame(summary(df$race))
  Race <- data.frame(
    group = c(rownames(race)),
    value = race$summary.df.race.
  )
  # Barplot
  raceplot<-ggplot(Race, aes(x=group, y=value)) + 
    geom_point(col="tomato2", size=3) +   # Draw points
    geom_segment(aes(x=group, 
                     xend=group, 
                     y=min(value), 
                     yend=max(value)), 
                 linetype="dashed", 
                 size=0.1) +   # Draw dashed lines
    labs(title="Dot Plot", 
         subtitle="Race Plot", 
         caption="source: mpg") +  
    coord_flip()
  raceplot
  })
  
  # Return the requested graph
  graphInput <- reactive({
    switch(input$graph,
           "academic_year" = academic_year(),
           "gender" = gender(),
           "major" = major(),
           "coding_experience" = coding_experience(),
           "race" = race()
    )
  })
  
  output$selected_graph <- renderPlot({ 
    graphInput()
  })
})
