

# Developer Platform

- What is Docusaurus? - [Docusaurus](https://docusaurus.io/docs)
- Docusaurus Deployment - [Deployment](https://docusaurus.io/docs/deployment)

<img src = "https://docusaurus.io/img/docusaurus_keytar.svg" height = "70">


## ⚙️ Setup
#### 1. Clone the Repository: 
   ```sh
   git clone https://github.com/apipinic/developer-platform.git
   ```
#### 2. Navigate to the Project Directory: 
   ```sh
   cd developer-platform
   ```
#### 3. Build and Run the Docker Container:
   ```sh
   docker build -t developer-platform .
   docker run -d --name developer-platform -p 3000:3000 developer-platform
   ```
#### 4. Access the Application:
   Open your web browser and go to `http://localhost:3000` (or alternatively to `http://127.0.0.1:3000`).

#### 5. Pull and Start the Container Directly:
   If you prefer not to build the container manually, you can pull and start the container with the following commands:
   ```sh
   docker pull ghcr.io/apipinic/developer-platform:latest
   docker run -d --name developer-platform -p 3000:3000 ghcr.io/apipinic/developer-platform:latest
   ```
## Deploy to Netlify
There are 2 required inputs for the action:
- `NETLIFY_AUTH_TOKEN` this is a [personal access token](https://app.netlify.com/user/applications#personal-access-tokens) created from your Netlify account
  - ⚠️ This should be stored as a [Github secret](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets) in your repo
- `NETLIFY_SITE_ID` this is the API ID of your Netlify site
  - To find this, go to your site's settings and in the "site information" copy the `API ID` field

In case of already having the deployment ready data - we can easily skip the nvm, install and build part via passing:

```
- name: Deploy to Netlify
  uses: jsmrcaga/action-netlify-deploy@v2.2.0
  with:
    NETLIFY_AUTH_TOKEN: ${{ secrets.NETLIFY_AUTH_TOKEN }}
    NETLIFY_SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}
    NETLIFY_DEPLOY_MESSAGE: "Deploy from GitHub Actions - Commit ${{ github.workflow_sha }} pushed by ${{ github.actor }}"
    NETLIFY_DEPLOY_TO_PROD: true
```
