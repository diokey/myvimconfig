## myvimconfig

This repo contains my current VIM set up to provide full featured IDE for Web development.

It supports IDE feautures like

* autocompletion
* codesnippet
* code analysis
* code folding / unfolding (f)
* autoclosing for (),[],{},'',""
* Integration with git

I'm currently using it for development of Javascript applications

The following list of languages and technology is currently fully supported by this configuration but can be extended to fit your needs

* Javascript
* HTML
* CSS
* Node.js
* Angular.js
* JQuery
* Jasmine
* Markdown

## Installation

### Requirements

The autocomplete feature will work properly if you vim configuration is configured with Luna.

To check if your vim is installed with Luna, type the following in VIM

```
echo has("lua")
```


If it returns 1, you are good to go. If it returns 0, you can try to install vim with lua or try install my repo from the


```
nolua branch
```

You also have to install [vundle] (https://github.com/gmarik/Vundle.vim)

Once vundle is installed just clone this repo

````
cd ~
git clone https://github.com/diokey/myvimconfig.git .
````

Then open vim, and simply type :PluginInstall

It will download and install all the plugins i'm using now...


I'll list the plugins i'm using very soon....

If you run into an issue, create an issue

