# NAME
**BlankOnDev** - Development tools for BlankOn GNU/Linux.

# DESCRIPTION

BlankOnDev merupakan tools untuk memudahkan pengembang BlankOn untuk melakukan 
beberapa aktifitas yang terkait dengan pengembangan BlankOn.
Untuk petunjuk penggunaan dapat Anda lihat di 
[BlankOnDev::Tutorial::id](https://metacpan.org/pod/distribution/BlankOnDev/lib/BlankOnDev/Tutorial/id.pod).

# HOW TO INSTALL

Untuk melakukan instalasi dapat dilakukan dengan cara manual
atau install melalui CPAN.

## Manual Install

### Install dependensi :
    
    cpan -i Crypt::Blowfish Digest::MD5 MIME::Base64 MIME::Base64::Perl JSON GnuPG Hash::MultiValue
    cpan -i Term::ReadKey LWP::UserAgent DateTime Text::SimpleTable::AutoWidth
    cpan -i Capture::Tiny Capture::Tiny::Extended UNIVERSAL::ref parent

### Install Paket :
    
    perl Makefile.PL
    make
    make test
    make install
    make clean

## Automatic Install (Install from CPAN) :
    cpan -i BlankOnDev

# MODULE AND UTILITIES

## BlankOnDev::config

[BlankOnDev::config](https://metacpan.org/pod/BlankOnDev::config) untuk menangani beberapa perintah "boidev", meliputi :
- perintah "boidev config",
- perintah "boidev mig_prepare",
- perintah "boidev config"
- perintah "boidev mig_prepare"
- perintah "boidev install-pkg"
- perintah "boidev gpg-auth-dec"
- perintah "boidev gpg-genkey"
- perintah "boidev list-cfg"
- perintah "boidev list-file"
- perintah "boidev rilis"
- perintah "boidev bzr2git"

## BlankOnDev::Migration::bazaar2GitHub

[BlankOnDev::Migration::bazaar2GitHub](https://metacpan.org/pod/BlankOnDev::Migration::bazaar2GitHub)
untuk menangani beberapa perintah "boidev bzr2git", meliputi :
- perintah "boidev bzr2git addpkg-group"
- perintah "boidev bzr2git addpkg"
- perintah "boidev bzr2git addpkg-file"
- perintah "boidev bzr2git remove-pkg-group"
- perintah "boidev bzr2git rename-pkg-group"
- perintah "boidev bzr2git remove-pkg"
- perintah "boidev bzr2git list-pkg"
- perintah "boidev bzr2git list-pkg-group"
- perintah "boidev bzr2git list-pkg all"
- perintah "boidev bzr2git search-pkg"
- perintah "boidev bzr2git branch"
- perintah "boidev bzr2git bzr-cgit"
- perintah "boidev bzr2git git-push"
- perintah "boidev bzr2git git-push-new"
- perintah "boidev bzr2git git-push-repo"
- perintah "boidev bzr2git git-check"
- perintah "boidev bzr2git re-branch"
- perintah "boidev bzr2git re-gitpush"

# AUTHOR

Achmad Yusri Afandi

# CONTRIBUTORS

BlankOnDev Development Team.

# LICENSE

Copyright (C) 2017 by Achmad Yusri Afandi and BlankOn Developer Team.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.