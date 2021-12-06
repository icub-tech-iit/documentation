Software Distros
===

## 🚀 Software Distros Workflow
- 📅 SW Distros are typically delivered on a **time-based workflow**.
- 4️⃣ SW Distros are usually released along with **binaries** at the following quarters: **Feb, May, Aug, Nov**.
- 🆓 The feature-freeze lasts **one month**.
- 📛 Naming convention adheres therefore to **`YYYY.MM.0`**, where **`YYYY`** identifies the year so as **`MM`** the month of the distro. The patch number **`0`** clarifies that it is a major distro. Examples: 2021.11.0, 2022.02.0...
- 📝 Repositories stay on their usual release convention in order to enable proper **semantic versioning**. To link repos tags to SW Distro and run CI, we rely on the infrastructure provided in [`robotology/robotology-superbuild`](https://github.com/robotology/robotology-superbuild).
- 📦 Occasionally, we may release **feature-based distros** and/or **patches** as a collection of tags/branches (i.e., no binaries). Naming convention follows the pattern **`YYYY.MM.P`**, where **`YYYY.MM`** identifies the major release used as baseline and the patch number **`P`** is simply increased also in the case of a feature or patch distro released after YYYY/MM.
- ⚠ Distros released before `2021.11.0` may be named without the patch number **`P`** and may also be marked explicitly with `feat` or `patch` labels. 
- 📢 We make **announcements** of the distros and their content on a dedicated channel of [Robotology Community](https://github.com/robotology/community/discussions/categories/releases).

## Software Versioning Table
The table hereinafter reports on the versions of the packages (specified in terms of Git tags/branches/commits)
composing our software ecosystem that are bundled as distros.

Once the versions are known, one can download the distro's source code by using Git.

For example, to download the SW Distro `2020.08` do:
```sh
$ git clone https://github.com/robotology/ycm.git -b v0.11.3
$ git clone https://github.com/robotology/yarp.git -b v3.4.0
$ git clone https://github.com/robotology/icub-main.git -b v1.17.0
 ...
```

## Table
This table has been generated automatically by processing data available in [`robotology/robotology-superbuild@v2021.11.0/releases`](https://github.com/robotology/robotology-superbuild/tree/v2021.11.0/releases).

Click on the distros below to explore their package versions:

- [📦 Distro **2021.11.0**](./2021.11.0.md)
- [📦 Distro **2021.08**](./2021.08.md)
- [📦 Distro **2021.08.1**](./2021.08.1.md)
- [📦 Distro **2021.05**](./2021.05.md)
- [📦 Distro **2021.02**](./2021.02.md)
- [📦 Distro **2021.02.feat-01**](./2021.02.feat-01.md)
- [📦 Distro **2020.11**](./2020.11.md)
- [📦 Distro **2020.08**](./2020.08.md)
- [📦 Distro **2020.08.patch-01**](./2020.08.patch-01.md)
- [📦 Distro **2020.08.feat-01**](./2020.08.feat-01.md)
- [📦 Distro **2020.05**](./2020.05.md)
- [📦 Distro **2020.05.feat-01**](./2020.05.feat-01.md)
- [📦 Distro **2020.02**](./2020.02.md)
