<div align="center">
  <h1> 🖼️ TinyPNG x Nautilus </h1>
  <p> A Nautilus Script for Efficiently Compressing Images with TinyPNG </p>
  
</div>

Simplify the process of compressing images with TinyPNG directly from Nautilus file manager. This Nautilus Script automates the task of uploading, compressing, and downloading images, saving time and effort for users.

### 🛠️ How it works

<!-- Video -->

https://github.com/saadh393/TinyPNG-x-Nautilus/assets/22261152/18abaf70-0539-4c3a-bb93-49ce3993fa5a



Select Images from your Nautilus File Explorer, Right click > Scripts > tinyPNG

### 🚀 How to Install

#### Recommended Step

Run this Command on Browser

```bash
git clone git@github.com:saadh393/TinyPNG-x-Nautilus.git ${XDG_CONFIG_HOME:-$HOME/.local/share/nautilus/scripts/} && cd {XDG_CONFIG_HOME:-$HOME/.local/share/nautilus/scripts/} && chmod -x tinypng.sh
```

#### Manual Way

- Clone this Repo

```bash
git clone git@github.com:saadh393/TinyPNG-x-Nautilus.git
```

- Change the file permission

```bash
  cd TinyPNG-x-Nautilus
  chmod -x tinypng.sh
```

- Move the `tinypng.sh` file into this file `/home/{USER_USER_NAME}/.local/share/nautilus/scripts` or run script

```bash
mv tinypng.sh $HOME/.local/share/nautilus/scripts
```

- Done, Now You can Perform the script from your Nautilus. Make Sure you have get your API

### 🗝️ Getting API

To obtain the API key:

1. Visit the TinyPNG developers website at [tinypng.com/developers](https://tinypng.com/developers).
2. Enter your name and email address to request access to the API.
3. Check your email for a confirmation message from TinyPNG.
4. Once confirmed, log in to the TinyPNG dashboard using your credentials.
5. After logging in, wait a few minutes for your API key to be generated.
6. You will receive your API key, which you can then use to authenticate your requests.

### 🛠️ Troubleshooting

If you encounter the error message `curl: (3) URL using bad/illegal format or missing URL`, follow these steps to resolve the issue:

1. Delete the `.tinypng.apikey` file located in your `$HOME` directory.
2. Run the script again.

This issue typically occurs when:

- You have provided an incorrect API key.
- Your API key has expired.
- You have exceeded the daily usage limit for the TinyPNG API.

By deleting the `.tinypng.apikey` file and retrying the script, you can resolve this issue and ensure proper functionality.

### 🙏 Thanks

- [Rany Albeg Wein](https://github.com/RanyAlbegWein)

### 🤝 Contribution

We welcome contributions to enhance this project. If you encounter any issues or have suggestions for improvements, please feel free to create an issue on GitHub. Additionally, if you'd like to contribute directly to the codebase, you can submit a pull request with your proposed changes. We appreciate your contributions to making this project even better!

In this rewritten Markdown:

- Section titles are prefixed with relevant emojis for better visual representation.
- Instructions are structured and formatted for clarity and readability.
- Links are properly formatted and presented.
- The content is organized and presented in a professional manner.
