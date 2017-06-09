package BlankOnDev::Migration::bazaar2GitHub::tmp_cfg;
use strict;
use warnings FATAL => 'all';

# Import Module :
use JSON::XS;
use Hash::MultiValue;
use BlankOnDev::Utils::file;

# Version :
our $VERSION = '0.1004';;

# Subroutine for add cfg :
# ------------------------------------------------------------------------
sub addpkg {
    my ($self, $data_dev, $data_rilis, $data_newpkg) = @_;

    my $dir_dev = $data_dev->{'dir_dev'};
    my $prefix_tmpCfg = $data_dev->{'prefix_tmpflcfg'};
    my $ext_tmp_cfg = $data_dev->{'fileTmp_Cfg_ext'};
    my $file_name = $prefix_tmpCfg.$data_rilis.$ext_tmp_cfg;
    my $locfile_tmp = $dir_dev.$file_name;

    # For New Data Packages :
    my $new_pkg = $data_newpkg->{'pkg'};

    # Read File config :
    if (-e $data_rilis) {
        my $read_fl = BlankOnDev::Utils::file->read($locfile_tmp);
        my $tmp_cfg = decode_json($read_fl);
        my $addpkg = Hash::MultiValue->new(%{$read_fl});
        $addpkg->add($new_pkg => $new_pkg);
        my $r_ = $addpkg->as_hashref;

        BlankOnDev::Utils::file->create($file_name, $dir_dev, $r_);
    }
}

# Subroutine for first create file temp :
# ------------------------------------------------------------------------
sub first_addpkg_fileTmp {
    my ($self, $data_dev, $data_rilis) = @_;

    my $dir_dev = $data_dev->{'dir_dev'};
    my $prefix_tmpCfg = $data_dev->{'prefix_tmpflcfg'};
    my $ext_tmp_cfg = $data_dev->{'fileTmp_Cfg_ext'};
    my $file_name = $prefix_tmpCfg.$data_rilis.$ext_tmp_cfg;
    my $locfile_tmp = $dir_dev.$file_name;

    # Check File addpkg temp :
    unless (-e $locfile_tmp) {
        BlankOnDev::Utils::file->create($file_name, $dir_dev, '{}');
    }
}
1;