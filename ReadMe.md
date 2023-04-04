# ReadMe

## Table of Contents

- [Background](#background)
    - [Policies](#policies)
    - [Settings](#settings)
- [Install](#install)
- [Usage](#usage)

## Background
This project is intended for high school students and teachers to help them query, estimate their grades and provides a optimal course-selecting plan according to the current gaokao policy in Shanghai.

### Policies
1. Students choose 3 from Physics, Chemistry, Biology, History, Politics and Geography and the score of it is related to the ranking, but not simply the real score.
2. Geography and Biology is tested in junior as part of gaoko.
3. Students have two chances to test English, and the final score is larger one.

### Settings
In this app, the timetable is set to be
| Grade\Exam |    1   |    2   |     3    |    4   |    5                       |
| :--------: | :---: | :---: | :-----: | :---: | :---------------------: |
|  Freshman  | All1  | All2  |    /    | All3  |           All4            |
|   Junior   | Nine1 | Nine2 |    /    | Nine3 | gaokao(Biology&Geography) |
|   Senior   | Six1  | Six2  | chunkao | Six3  |                  /         |
And for the query system, the time is set to be the fourth test in the semester.
- **Freshman**: All1, All2, All3
- **Junior**: All1, All2, All3, All4, Nine1, Nine2, Nine3
- **Senior**: Nine1, Nine2, Nine3, gaokao, Six1, Six2, chunkao, Six3

## Install
 1. Open MATLAB and download the project_group15.mlappinstall into your MATLAB.
 2. In MATLAB, double click the project_group15.mlappinstall, and click "install（安装）" in the window, and then the app will show up in the APP column, as shown in below.
![](https://codimd.s3.shivering-isles.com/demo/uploads/upload_0e07821570c1aadb703cf2dcf501ab37.png)

3. Double click the icon and the app will start up.




## Usage
Before you start: A pop-up window will show for you to get the directory, choose the package named "data source" in the list.
* For Mac
![](https://codimd.s3.shivering-isles.com/demo/uploads/upload_c4c80555af74935e32d935d8e4c5c5bd.png)
* For Windows
![](https://codimd.s3.shivering-isles.com/demo/uploads/upload_5f8c1c3a794f74044891c07bae726955.jpg)

* **Special mention**: In mac system, chances are that after you click the open button, the main app will disappear. Don't worry, it doesn't disappear, actually it just hides under the main page, click the icon(left or right depends on your system) again to let it show.
![](https://codimd.s3.shivering-isles.com/demo/uploads/upload_b3d55ecfd7f7b0870bfd740661e6758a.png)


Homepage:
> Choose your identity from "Freshman", "Junior/Senior" and "Teacher".

Freshman window:
> A editable space will be shown. Input your student ID (available: 1001-1076) and click the "START" button.
> The data and the corresponding visualization will be presented in the window.
> If you want to go back to homepage, click the "BACK" button.

Junior/Senior window:
> A editable space will be shown. Input your student ID (available: 2001-2080, 3001-3078) and click the "START" button.
> The data and the corresponding visualization will be presented in teh window.
> To get detailed data, click the Detailed Score button (If you see "-2" in the table, that means you did not attend the corresponding exam).
> If you want to go back to homepage, click the "BACK" button.

Teacher window:
> A editable space will be shown. Input the grade that you are responsible for (available: freshman, junior, senior) and click the "START" button. 
> Then choose the subject.
> If you want to go back to homepage, click the "BACK" button.
