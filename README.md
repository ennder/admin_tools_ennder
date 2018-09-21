# admin_tools_ennder
===========

Pages informatives de test et de développement

- DO NOT USE previous gem versions before 1.3.20, they can be used to execute arbitrary commands on your server !

Features
--------

1. Ajoute une page de menu d'admin
2. Ajoute tous les sous-menus de cette page

La page de menu a pour Url : /admin/menu (route automatique : **admin_menu_url**)

**Menu**

* Liste des inflexions
* Liste des traductions
* Liste des routes
* Liste des gems
<br/>
* Liste des processus du serveur
* Liste des processus du serveur (metal)
<br/>
* Infos de developpement
* Infos de l'Url courante
<br/>
* Execution de commandes shell
* Télécharger un fichier

Unsolved problems :
No tests developped

Examples
--------

    <%= link_to "Menu d'administration", admin_menu_url %>

Requirements
------------

- Rails 3 or greater
- gem Open4 pour l'execution des commandes
- a file named : config/auth_password_admin.secret in your app :
Containing the http authentication password needed for the commands controller

Install
-------

- install the gem manually
[sudo] gem install admin_tools_ennder
Or
- add id to your Gemfile
- Create a file containing the http authentication password needed for the commands controller
echo '<A PASSWORD>' >config/auth_password_admin.secret
Change <A PASSWORD> for a reliable password.

Author
------

Original author: Ennder

License
-------

(The MIT License)

Copyright (c) 2010-2016 Ennder

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

