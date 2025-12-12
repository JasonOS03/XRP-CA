Name: Jason O’Sullivan 

Student number: C22400796 

Class Group: TU856/4

GitHub: https://github.com/JasonOS03

Project Title: PollinatorXR – an XR flower pollinator simulator 

# Video
[![Alt Text](http://img.youtube.com/vi/AlQ7xfUlVl4/0.jpg)](https://youtube.com/embed/watch?v=AlQ7xfUlVl4)

# Screenshots

# Description of the project

The character of this project represents a bee. This bee floats around an area representing a garden, which spawns a 4x4 grid of flowers. The character can teleport to each flower using a point-and-click teleport mechanic. Once the flower is touched, it blooms and pollen is released into the air (in the form of particles). A pollen counter is maintained, and once all the flowers have bloomed, the goal of pollinating all the flowers will be complete, and victory music will play in the background. The garden contains a stone monument, and this stone monument once pointed at or clicked, will reset the scene to allow for a continuous gameplay loop. The garden also contains a sign, and once clicked will display a fun fact about pollination to the user. Different sounds are played, including relaxing garden music, victory music when all flowers are pollinated, and a buzzing sound coming from the bee.

This project was built to demonstrate an interactive scene which aligns with SDG: 15 Life on Land and shows the importance of pollination for the environment and for the flower and crop life cycle. 

# Instructions for use
Step 1:
 Clone the repo
 Open the garden.tscn scene and set it as the main scene in the project settings
Step 2:
 connect the vr headset
Step 3:
Press the remote deploy button in Godot
Step 4:
 Interactions (VR):
 Pick up controller: activate pointer
 Point: Teleport to pointed area
 A/X Button: Teleport to clicked area/ click on sign,flowers or stone monument

# How it works
Upon the main garden scene loading, a 4x4 grid of flowers, a stone monument, background trees and a wooden sign spawn in the garden. This is achieved using the .instantiate() function. The garden music and bee buzzing sounds begins playing as soon as the scene is loaded and plays through the AudioStreamPlayer3D node containing .mp3 files. A label3D node displays a label in the top left corner of the headset containing the number of flowers pollinated, which is intiallly set to 0. When pointing at a specific area or clicking on a particular area of the garden using the pointer, the bee teleports to that location. 
Upon touching a flower ( through clicking or pointing) The flower shoots out pollen using the GPUParticles3D node. Once pollinated the unbloomed flower swithes to a bloomed flower. The pollination counter label also increases in value when a flower is pollinated. Once all flowers in the garden are pollinated, the label displays text notifying the user that all flowers have been pollinated. Victory music also plays briefly to indicate all flowers have been pollinated.
The entire garden scene can then be reset by pointing at or clicking on the stone monument allowing for a continuous gameplay loop as the flowers can be pollinated again. When the wooden sign in the garden is clicked or pointed at, text displays on the sign via a Label3D displaying a fun fact about pollination for educational purposes. 

# List of classes/assets in the project
garden.gd: self-written
flower.gd: self-written
stone_monument.gd: self-written
function_pointer.gd: OpenXR Tools built in script provided when using FunctionPointer node
pointer_event.gd: OpenXR Tools built in script
righthand.gd: self-written
lefthand.gd: self-written
woodensign_2.gd: self-written

Assets:
Garden Mesh: imported 3D model from Free3D.com
Sign Mesh: imported 3D model from Free3D.com
Stone Monument Mesh: Imported form Free3D.com
Bloomed Flower Mesh: Imported from Free3D.com
Unbloomed flower meshes: Imported from sketchfab.com
Tree mesh: imported 3D model from Free3D.com

# References
Pollination fun fact:  The Importance of Pollinators | USDA (2025). Available at: https://www.usda.gov/about-usda/general-information/initiatives-and-highlighted-programs/peoples- garden/importance-pollinators (Accessed: 11 December 2025).
 
 The XR action map (no date) Godot Engine documentation. Available at: https://docs.godotengine.org/en/4.4/tutorials/xr/xr_action_map.html (Accessed: 11 December 2025).
 
 Tween (no date) Godot Engine documentation. Available at: https://docs.godotengine.org/en/stable/classes/class_tween.html (Accessed: 11 December 2025).

 Basic XR Locomotion (no date) Godot Engine documentation. Available at: https://docs.godotengine.org/en/stable/tutorials/xr/basic_xr_locomotion.html (Accessed: 11 December 2025).


# What I am most proud of in this assignment
I am most proud of the different interactions I developed through the code, and the level of interactivity I was able to achieve. One example of such interactivity is the flowers themselves. Once touched or clicked, pollen spreads outward from the flower and the flower becomes a bloomed flower. Another I aspect I am proud of is the high level of polish achieved in terms of the interactions with the environment, movement was made smooth through the use of tweens and clicking on objects was made more smoother through the modification of the transforms of the CollisionShape3D's and Area3D's.

# What I learned
- I learned that the XR Toolkit is a powerful and very useful tool for XR development in Godot through its pre-built scenes and also its provided nodes. I learned how to use  the FunctionPointer tool to efficiently and effectively add point and click functionality to my project.
- I also learned how to map button inputs using the XR Action Map and use signals to detect button presses with the XR controllers. This proved tricky to get fully working as there were many conflicts with the Action Map causing button clicks to not register. Eventually this was solved through manual button index mapping in the code and the use of the XRToolsPointerEvent node type.
- I learned how to instantiate other scenes in the main garden scene e.g. the flower scene and effectively modify their transforms to ensure positions, scale, rotation etc are at desired values.
- I also learned how to to effectively modify the GPUParticles3D node properties such as gravity, linear velocity etc in order to achieve the desired output. It taught me how particle systems work in Godot and how they can be used effectively.
- I learned the importance of properties such as attenuation and Volume dB in the audio output when using the AudioStreamPlayer3D node. Attenuation measures how sound fades over distance and Volume dB is used to tune volume levels to your liking.



# Project Proposal

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

 

 

 
