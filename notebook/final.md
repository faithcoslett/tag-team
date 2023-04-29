### 1. Synopsis of projects goals
Our goal was to design and implement an app that functions as a user-generated media to-do list. A user would create all the entries in the app's local database by adding any books, movies, games, podcasts, etc. that they wanted to get around to checking out. The user would be able to add, edit, delete, and search their entries. Each entry would contain the title, type, length, and genre of the media, as well as having a space for any personal notes the user wished to add. We also wanted to implement a tagging system, where the user could add tags to an entry that could then be used in filtering their media list. This would allow users to quickly find what they're in the mood for. We wanted to have the app come with a set of default tags while also allowing for custom ones to be added. 


---

### 2. Links to status updates
- [Status 1](https://github.com/faithcoslett/tag-team/blob/main/status/status1.md)
- [Status 2](https://github.com/faithcoslett/tag-team/blob/main/status/status2.md)
- [Status 3](https://github.com/faithcoslett/tag-team/blob/main/status/status3.md)
- [Status 4](https://github.com/faithcoslett/tag-team/blob/main/status/status4.md)

---

### 3. Links to videos and presentations
- [4/14 Demo Video](https://github.com/faithcoslett/tag-team/blob/main/presentation/demo-4-14.mp4)
- [4/19 Demo Video](https://github.com/faithcoslett/tag-team/blob/main/presentation/demo-4-19.mp4)
- [4/21 Demo Videos](https://github.com/faithcoslett/tag-team/tree/main/presentation/demo-4-21)
- [Final Presentation Slides](https://github.com/faithcoslett/tag-team/blob/main/presentation/tag-team-URD-slides.pptx)

---

### 4. Project planning and execution

#### A. Design requirements and specification
[Components Breakdown Document](https://docs.google.com/document/d/1MFWXNHD9cfpF8HfS8RD6v8KfIkruhewEW7MYEIdmIWU/edit?usp=sharing)

#### B. Finalized plan of work (expected vs. actual)
There are several differences between the expected plan from the first semester and the final plan in the second semester, which are detailed below:
| **Expected**                                                                                   | **Actual**                                                      |
|------------------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| App only works on web or Android                                                               | Cross-platform on web/Android/iPhone/Mac/Windows/Linux          |
| Programmed in Java or Kotlin                                                                   | Programmed in Flutter framework of Dart                         |
| SQL database package                                                                           | Isar database package                                           |
| Have default set of tags preinstalled on app                                                   | Set of tags populated only by custom tags                       |
| Have search field work on all fields                                                           | Search field only works on title field                          |
| Rough versions of frontend/backend/database all implemented at once then improved on in cycles | Functioning version of each component implemented one at a time |

---

### 5. Summary of final implementation

#### A. Design
Our final app is a cross-platform, user-generated database designed for entries to describe various types of media the user wants to view in the future. Entries can be added, edited, and deleted, as well as given custom tags by the user for the purpose of filtering. An entry can also be searched for by its title. The app is written in the Dart language and uses the Flutter framework for the frontend design. The Isar package is used for managing and querying the database.

#### B. Limitations
- No default set of tags
- Only option for organization is one large list
- Non-tag search can only be done on title field
- Not published yet on any platform, so no persistant data between runs of the program

#### C. Future direction
- Further develop look of the interface
- Include default set of tags with the app
- Allow for creation of sublists
- Allow for user to search based on any field
- Have persistant data

#### D. Statement of work
The team worked well together due to frequent communication and equal delegation of work. The roles and work were split up as follows:
- Ally Hays: Created the original project concept and guided the development of the idea; handled all of the frontend code.
- Charles Myers: Designed and implemented the database; helped with backend code.
- Faith Coslett: Handled documentation (reports, presentations, written deliverables) and group organization; helped with backend code.
- Joshua Malone: Designed and implemented the database; helped with backend code.

---

### 6. Reflection on team's ability to design, implement, and evaluate a solution

#### A. Lessons learned
- Start work early, even if deadlines are far away at the time. Surprises and deviations from the plan are inevitable, and investing time early will make adapting much easier.
- Check the compatibility of all components before majorly moving to the design phase of the project. This prevents you from creating a design plan centered around a part that won't end up working with the others, thus also saving time on redesigns.
- Open group communication is valuable. We kept each other updated on new issues and on our individual work progress, which kept us all on the same page. This was also crucial to coordinating our code pushes, since much of our development work needed to be done in the same file.

#### B. What we'd change if we did it all over again
- Decide on the specific software components we'll use and test their compatibility during semester one. This would have prevented the sudden pivot we had to make later in the project when our planned SQL package did not support the app running on the web.
- Dedicate more time early in the semester so there is less crunch-time in the second half. Our schedules were busy and we were often unable to work on the project when we planned to due to other responsibilities or surprises, and this would have been easier to manage if we focused on code implementation earlier. This also would have given us more development time to address the limitations mentioned above. 

#### C. Advice to future teams 
- Don't hesitate to ask your team members for help if you're facing a challenge, or being honest about where you're at in your share of the work.
- Dedicate time to the project early, even if deadlines seem far away.
- Create an online space that allows for easy group communication and sharing of files from anywhere, such as a Discord channel.
- Invest in the planning stage of the project, especially in semester one. This includes choosing specific components and testing their viability for your ideas.
