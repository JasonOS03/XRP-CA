Name: Jason O’Sullivan 

 

Student number: C22400796 

 

Project Title: PollinatorXR – an XR flower pollinator simulator 

 

Project Idea:  

The character of this project represents a bee. This bee floats around an area representing a garden, which grows many flowers. The character can teleport to each flower using a point-and-teleport mechanic. Once the flower is touched, it blooms and pollen is released into the air (in the form of particles). A pollen counter is maintained, and once all the flowers have bloomed, the goal of pollinating all the flowers will be complete, and victory music will play in the background.  

 

Sustainable Development Goal: 

The Sustainable development goal that my project addresses is SDG 15 – Life on Land. The bee itself is a life form, which teleports to these flowers, blooms and pollinates them. The blooming and pollination of the flowers allows them to thrive. It allows users to understand the importance of pollination for a healthy ecosystem. 

 

 

This project is an extension of the Quest:SDG project. The user will grab the Life on Land box, and this will spawn the garden scene. 

This project will be done on an individual basis. 

Key Features and Interactions: 

Teleportation Locomotion: Users will fly to each individual flower using a point and teleport system. This mechanic ensures each flower is easily moved to and accessed.This functionality is provided by the library XR Toolkit. 

Trigger based flower touching: When the user teleports to the flower, they can touch the flower, and it will bloom and release pollen into the environment as a reaction. Implemented through XR Toolkit for the interaction and the hand collisions will be detected by the OpenXR

Particle Effects: Pollen particle effects will appear when the flowers are bloomed, which will provide visual feedback for the user. Implemented using Godot's built in particle system

Pollination counter – A counter will be kept in the top corner of the screen to notify the user of how many flowers have been pollinated. 

XR Technologies: 

Hand Tracking: When the user touches the flower with their virtual bee legs/antennae, the flowers will be pollinated. This feature is provided by the XR Toolkit  

Teleportation Locomotion: Allows the user to seamlessly travel between flowers. 

Spatial Audio: birds chirping, bees buzzing, and calm ambient music will be used to create a relaxing atmosphere. Achieved using Godot's 3D audio system

Passthrough: The user will be able to see the sky as their real life background, making the garden appear as if it existed in their own environment. Passthrough will be implemented through the OpenXR library 

 

Initial QuestSDG main UI scene:


 ![Alt Text](20251019_225034.jpg)

 

First Person view of garden scene 

 ![Alt Text](20251019_225115.jpg)

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

Key interactions/ flower grabbing scene 

 ![Alt Text](20251019_225214.jpg)

![Alt Text](20251019_225429.jpg)
 

 

 

 

 

 

 

 

 

 

 

 

 

 

Spatial Layout/environment 

 ![Alt Text](20251019_225145.jpg)

 

 

 
