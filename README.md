# mkdocs tests
This repository contains tests for mkdocs



here is how the site in https://icub-tech-iit.github.io/fix-test-mkdocs/ is generated:

1. follow instructions in  https://www.mkdocs.org  to install mkdocs

2. generate the source code of the site with:

   ```
   $ mkdocs new my-project
   $ cd my-project
   ```

3. create the preview of the site with:

   ```
   $ mkdocs serve
   ```

4. view the site by opening a browser on url: `http://127.0.0.1:8000` 

5. edit the `docs/index.md` document and add markdown content (see https://www.markdownguide.org/ to know more about markdown). possible editors: typora, atom, ...

6. as soon as you save the changes on the document, yiou browser is refreshe with them 

7. when you are happy with the the result, digit:
   ```
   mkdocs build
   ```

8. copy the content of the newly generated folder `site`  inside our `docs` folder



