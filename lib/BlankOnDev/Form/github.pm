package BlankOnDev::Form::github;
use strict;
use warnings FATAL => 'all';

# Import :
use Term::ReadKey;
use BlankOnDev::Rilis;
use BlankOnDev::command;

# Version :
our $VERSION = '0.1005';

# Subroutine for config github :
# ------------------------------------------------------------------------
sub form_config_github {
    my ($self, $name, $email) = @_;

    # Prepare form :
    my %data = ();
    my $confirmation;
    my $form_cache;
    my $form_clear;
    my $data_cache;
    my $home_dir = $ENV{"HOME"};
    my $read_fileCfg;
    my $gitname;
    my $gitemail;
    my $r_gitset;

    # Get Command :
    # ----------------------------------------------------------------
    my $get_cmd = BlankOnDev::command::github();
    my $getGit_cmd = $get_cmd->{'git'};
    my $gitCmd_name = $getGit_cmd->{'cfg-name'};
    my $gitCmd_email = $getGit_cmd->{'cfg-email'};
    my $gitCmd_authCache = $getGit_cmd->{'cfg-credential-cache'};
    my $gitCmd_authCache_clear = $getGit_cmd->{'cfg-creden-cache-clear'};
    my $gitCmd_list = $getGit_cmd->{'cfg-list'};
    my $gnupg_cmd = $get_cmd->{'gpg'};

    # Check file config github :
    if (-e $home_dir.'/.gitconfig') {
        # Form Confirmation :
        print "\n\n";
        print "You want reconfig github ? [y or n] ";
        chomp($confirmation = <STDIN>);
        if ($confirmation eq 'y') {

            if ($name ne '' and $email ne '') {
                system("$gitCmd_name \"$name\"");
                system("$gitCmd_email \"$email\"");
                $r_gitset = 1;
            } else {
                $r_gitset = 0;
                print "git user.name or user.email not enter\n";
                exit 0;
            }
        }

        # Check Data cache :
        $read_fileCfg = BlankOnDev::Utils::file->read($home_dir."/.gitconfig");
        if ($read_fileCfg =~ m/(helper)\s(\=)\s(.*)/) {
            print "\n";
            print "You want to clear cache usename and password ? [y or n] ";
            chomp($form_cache = <STDIN>);
            if ($form_cache eq 'y' or $form_cache eq 'Y') {
                system($gitCmd_authCache_clear);
            }
        } else {
            print "\n";
            print "You want to cache username and password github ? [y or n] ";
            chomp($form_cache = <STDIN>);
            if ($form_cache eq 'y' or $form_cache eq 'Y') {
                system("$gitCmd_authCache --timeout=86400");
            }
        }


    } else {
        if ($name ne '' and $email ne '') {
            system("$gitCmd_name \"$name\"");
            system("$gitCmd_email \"$email\"");
            $r_gitset = 1;
        } else {
            $r_gitset = 0;
            print "git user.name or user.email not enter\n";
            exit 0;
        }

        # Check Data cache :
        $read_fileCfg = BlankOnDev::Utils::file->read($home_dir."/.gitconfig");
        if ($read_fileCfg =~ m/(helper)\s(\=)\s(.*)/) {
            print "\n\n";
            print "You want to clear cache usename and password ? [y or n] ";
            chomp($form_cache = <STDIN>);
            if ($form_cache eq 'y' or $form_cache eq 'Y') {
                system($gitCmd_authCache_clear);
            }
        } else {
            print "\n\n";
            print "You want to cache username and password github ? [y or n] ";
            chomp($form_cache = <STDIN>);
            if ($form_cache eq 'y' or $form_cache eq 'Y') {
                system("$gitCmd_authCache --timeout=86400");
            }
        }
    }
}
1;