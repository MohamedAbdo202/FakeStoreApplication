# pyramakerz

API choice → Fake Store API (https://fakestoreapi.com)

Steps To Run The Project:

1- Download the code from Github Folder.ZIP

2-Extract The Folder

3-Open Android Studio And Press Open and Choose The Folder of The Project

4-Oen Terminal and Enter flutter pub get and run build runner

5-Open Emulator 

6-Run The project

## State management  →  used Cubit (lightweight, testable, simple).

## Design System( Color Scheme, Typography, Material3)

## Architecture overview → Clean Architecture:

Data (models, API, repositories)

Domain (entities, usecases, repositories)

Presentation (Cubit + UI)

## SOLID notes →

S: Each class has a single responsibility (e.g., ProductsCubit only manages product state).

O: Open/closed via abstract repositories.

L: Entities can be replaced with models.

I: Interfaces used for repositories, only what’s needed is implemented.

D: High-level depends on abstraction, not concrete APIs.

## Features

Authentication → Simple login.

Browse → Infinite scroll + pull-to-refresh product feed.

Search → Debounced keyword search.

Category Filter → Dynamic from API, persists until cleared.

Product Details → Full description + image carousel + wishlist toggle.

Wishlist → Save/remove locally (Hive), works offline.

Error Handling → Friendly retry UI with snackbars.

Responsive UI → Material 3 + Clean design system.


Link Video: https://drive.google.com/file/d/1LYvcVmDnh1Hb-8NCEDYmGiqBZGzFH7QI/view?usp=sharing
Link APK: https://drive.google.com/file/d/1-tU4Khqloa9J7RczlffKkdbhMs_ngIxm/view?usp=sharing

