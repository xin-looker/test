explore: survey {}


view: survey {
  derived_table: {
    sql:
      SELECT
      '3/27/2020 15:11:20' AS timestamp, 'Less than 6 months' AS how_long_have_you_been_in_the_team, 5 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Work life balance, Social interaction opportunities, The amount of physical activity, Accessibility of help during the work, Breaks and rest time every day, Productivity at work' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 1 AS how_are_you_feeling_right_now, 'Work life balance, Social interaction opportunities, The amount of physical activity, risk to Covid19, Accessibility to help during the work, Breaks and rest time every day, Productivity at work, Personal factors (physical health, mental health, relationship etc), WFH setup not great' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'Work on my setup (my responsibility ) ' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, NULL AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/27/2020 15:18:12' AS timestamp, 'More than 12 months' AS how_long_have_you_been_in_the_team, 3 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Work life balance, Social interaction opportunities, The amount of physical activity, Food' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 3 AS how_are_you_feeling_right_now, 'Work life balance, The amount of physical activity, Breaks and rest time every day, Productivity at work' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'Breaks like the ones we had to complete the google training would be great. It would allow us time for exercise and to disconnect from work, as now there isn't a moment when you "disconnect" from your workplace since it's all the same. I eat and work from the same place, and that can add to the stress of staying at home for long periods of time.' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, NULL AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/27/2020 15:35:50' AS timestamp, 'More than 12 months' AS how_long_have_you_been_in_the_team, 2 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Work life balance, Breaks and rest time every day, Productivity at work' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 2 AS how_are_you_feeling_right_now, 'Work life balance, The amount of physical activity, risk to Covid19, Breaks and rest time every day' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'I think I want to start to track my work time, recently I'm using google calendar to track all the daily tasks, it helps my focus a bit, however, still some unexpected tasks and tickets might change my plan completely which makes me feel losing track of the daily plan.

      The chair and table at home are not very comfortable. If we can expense a new chair that would be great! ' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, 'Don't stay too late everyday, try to set a strict deadline on the work and complete the important ones before 5:30, this will help on maintaining a good mental health.

      Use DCL circles, don't slack the private messages when asking questions

      Tell more stories of your day if you have it, let's do more online activities, we can play games, do more excise competitions, baking shows etc. It would be less boring. ' AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/27/2020 16:27:19' AS timestamp, '6 - 12 months' AS how_long_have_you_been_in_the_team, 4 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Work life balance, Social interaction opportunities, News and general information around me, Personal factors (physical health, mental health, relationship etc)' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 3 AS how_are_you_feeling_right_now, 'Social interaction opportunities, The amount of physical activity, risk to Covid19, News and general information around me' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'I need an ergonomic chair but unable to collect that from Google build as I don't have how to carry it. A stand desk (doesn't need height adjustable if the height fixed is right for me) and that desk board superficie we had in wework for the couch, I just don't know the name of it but that we can work on the couch as well' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, 'Be more present and active in the virtual zoom KT. I know some people would personally avoid as they feel more concentrated out of it, but I think at this time with all of that we are going through with Covid-19 requires that extra effort from us to support and be there for the others not only for us. I mean, you might be fine to just ask question for slack, but not only think about you but others to have a nice environment as well' AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/27/2020 16:31:24' AS timestamp, 'More than 12 months' AS how_long_have_you_been_in_the_team, 3 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Social interaction opportunities, News and general information around me, Accessibility of help during the work, Productivity at work' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 2 AS how_are_you_feeling_right_now, 'Work life balance, Social interaction opportunities, The amount of physical activity, risk to Covid19, News and general information around me, Breaks and rest time every day, The amount of stuff we are working on it seems higher than it should be given the times we are living. Priority should be on individual health as per the numerous global communications we have received this week. This is not what is happening, I've been stuck in a room for 11h daily during the past week, with no time to exercise, have a walk, cook, or help my family.' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'Need a better set-up, screen, chair, "standing desk". More break and flexible time.' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, 'Be more participative with sanity check questions. Understand we are not all living the same situation: some are more affected, some countries are in more serious danger than others.' AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/27/2020 16:35:19' AS timestamp, 'More than 12 months' AS how_long_have_you_been_in_the_team, 4 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Social interaction opportunities, News and general information around me, Productivity at work' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 2 AS how_are_you_feeling_right_now, 'risk to Covid19, News and general information around me, Personal factors (physical health, mental health, relationship etc)' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'I bought a chair and setting up a place to work that feels like im working and have privacy and quite' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, 'Keep reaching out to people keep the social interaction across the team. ' AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/27/2020 17:42:22' AS timestamp, 'More than 12 months' AS how_long_have_you_been_in_the_team, 3 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Social interaction opportunities' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 5 AS how_are_you_feeling_right_now, 'Work life balance, The amount of physical activity, Breaks and rest time every day, Productivity at work, Personal factors (physical health, mental health, relationship etc)' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'none' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, 'Set an area for work; not your bed or your front room if possible. It helps boundaries for work/life balance. Go out for a walk during lunch break too. ' AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/30/2020 9:47:01' AS timestamp, 'Less than 6 months' AS how_long_have_you_been_in_the_team, 5 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Work life balance, Social interaction opportunities, News and general information around me, Accessibility of help during the work, Breaks and rest time every day, Productivity at work, Personal factors (physical health, mental health, relationship etc)' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 4 AS how_are_you_feeling_right_now, 'Social interaction opportunities, risk to Covid19' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'Ergonomic Home Office Setup' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, NULL AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/30/2020 9:48:32' AS timestamp, '6 - 12 months' AS how_long_have_you_been_in_the_team, 4 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Social interaction opportunities, Accessibility of help during the work, Productivity at work' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 3 AS how_are_you_feeling_right_now, 'Work life balance, risk to Covid19, News and general information around me, Accessibility to help during the work, Productivity at work' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'Desk setup ' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, NULL AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/30/2020 11:30:51' AS timestamp, 'More than 12 months' AS how_long_have_you_been_in_the_team, 4 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Work life balance, Social interaction opportunities, Breaks and rest time every day, Productivity at work' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 2 AS how_are_you_feeling_right_now, 'Work life balance, Social interaction opportunities, The amount of physical activity, risk to Covid19, Accessibility to help during the work, Productivity at work, Personal factors (physical health, mental health, relationship etc)' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'I'd love to have a better desk set up. It takes long time to have food ready during lunch. It does not feel as a break as I do not rest. Work hours are longer and I take less breaks. The energy to go to work is not the same energy than staying at home to work.' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, 'EVERYBODY should participate in the virtual KT. It feels lonely and sad. It is hard to get help. There are more barriers now. We should have social meetings to catch up and remember we are part of an amazing team of people.' AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/30/2020 16:16:38' AS timestamp, 'More than 12 months' AS how_long_have_you_been_in_the_team, 4 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Accessibility of help during the work' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 2 AS how_are_you_feeling_right_now, 'Accessibility to help during the work' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'I feel we need a better place for asking sanity check questions. ' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, NULL AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/30/2020 16:47:52' AS timestamp, 'More than 12 months' AS how_long_have_you_been_in_the_team, 5 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Work life balance, The amount of physical activity' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 5 AS how_are_you_feeling_right_now, 'Work life balance, The amount of physical activity' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'bigger home, more wifi, stocked fridge' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, NULL AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/30/2020 16:48:38' AS timestamp, '6 - 12 months' AS how_long_have_you_been_in_the_team, 4 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Social interaction opportunities, The amount of physical activity, Accessibility of help during the work, Productivity at work' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 3 AS how_are_you_feeling_right_now, 'risk to Covid19, News and general information around me, Accessibility to help during the work, Breaks and rest time every day, Personal factors (physical health, mental health, relationship etc)' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'The lack of an ergonomic work environment is a huge issue, and it is very difficult to improve - there is just no place for a normal table and chair in my home, and in homes of some of my colleagues as well. Also, finding a place for a meeting can be challenging when all the people in the household have their meetings at the same time.' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, NULL AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/30/2020 17:08:07' AS timestamp, 'More than 12 months' AS how_long_have_you_been_in_the_team, 5 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Work life balance, Social interaction opportunities, The amount of physical activity, Accessibility of help during the work, Breaks and rest time every day, Personal factors (physical health, mental health, relationship etc), Freedom , No lockdown. No concerns about families getting sick. KT.  Snacks ,  Coffee and food available. People around. ' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 1 AS how_are_you_feeling_right_now, 'Work life balance, Social interaction opportunities, The amount of physical activity, risk to Covid19, Accessibility to help during the work, Breaks and rest time every day, Productivity at work, Personal factors (physical health, mental health, relationship etc), Not great. It is hard to work in a nice mood, when your mind is constantly worried about how to avoid your family get sick, and if they do we will not be able to do anything.  It seems I spend more time working. It is hard to take breaks to get some coffee or sneaks, once we need to prepare it, an it would take longer than 5 minutes. It is hard to cook your lunch everyday and eat in 1hour. I spend too much time sit and I feel the pain on my knees and my back. I miss the KT , the VKT is not the same as people hardly engage there. I feel so tired after my shift that is hard to do physical exercises that I was used to do after work. ' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'I have no idea. I really wish this could be possible somehow. I have a nice desk, and a nice chair. It would be great to have my monitor, mouse, etc. But they are in the office. I would like to have a stand table, so I didn't need to stay the whole day sit, and this could help with the knee and back pain. In a dream world, I would like to have my lunch ready, so I wouldn't need to cook, eat, and wash the dishes in 1hour lunch time (If you get read of your chat on time). ' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, 'Engage more on the KT, not only with questions but also with some jokes, I don't know. It is being hard to laugh these days. Maybe virtual play dates. But still, we would be in front of the computer after the whole day of shift? I wish we could at least leave for lunch on the right time, maybe our Sr. Analysts could help the stuck chatters close to their lunch time and end of shift time to get unstuck.' AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, 'I miss our people and our environment in the office , at the same time I wish I could be in my hometown taking care of my parents. ' AS anything_else_you_want_to_add
      UNION ALL
      SELECT
      '3/31/2020 10:10:36' AS timestamp, 'More than 12 months' AS how_long_have_you_been_in_the_team, 3 AS how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home, 'Work life balance, Social interaction opportunities, The amount of physical activity' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question?, 4 AS how_are_you_feeling_right_now, 'Work life balance, Breaks and rest time every day, Productivity at work' AS what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question, 'I definitely need a better place to work, like an actual table that could be my office space.' AS if_you_want_to_make_some_improvements_to_your_wfh_experience, 'Try to go for a walk every morning before work, just so that you have a "mental break" from being at home all the time. The "commute" helps me put myself in a better work mood.' AS what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better, NULL AS anything_else_you_want_to_add

      ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  dimension: how_long_have_you_been_in_the_team {
    type: string
    sql: ${TABLE}.how_long_have_you_been_in_the_team ;;
  }

  dimension: how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home {
    type: number
    sql: ${TABLE}.how_were_you_feeling_since_the_beginning_of_the_year_before_working_from_home ;;
  }

  dimension: what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question? {
    type: string
    sql: ${TABLE}.what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question? ;;
  }

  dimension: how_are_you_feeling_right_now {
    type: number
    sql: ${TABLE}.how_are_you_feeling_right_now ;;
  }

  dimension: what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question {
    type: string
    sql: ${TABLE}.what_would_you_say_are_the_contributing_factors_in_your_answer_to_the_above_question ;;
  }

  dimension: if_you_want_to_make_some_improvements_to_your_wfh_experience {
    type: string
    sql: ${TABLE}.if_you_want_to_make_some_improvements_to_your_wfh_experience ;;
  }

  dimension: what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better {
    type: string
    sql: ${TABLE}.what_do_you_think_your_team_and_peers_can_do_to_make_wfh_experience_better ;;
  }

  dimension: anything_else_you_want_to_add {
    type: string
    sql: ${TABLE}.anything_else_you_want_to_add ;;
  }

  measure: count {
    type: count
  }
}
