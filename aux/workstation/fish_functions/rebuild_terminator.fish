function rebuild_terminator -d "recompile terminator config from partials"
#···············································································

    #   cache our current directory
    set -l PWD_CACHED (pwd)

    set -l BASE_DIR /z/750/dot/repos/tty-gnome-terminator/config

    #   set $TIMESTAMP_UNIX with custom timestamping function
    __timestamper

    set -l GEN_FILE     $BASE_DIR/config_compiled.ini
    set -l BAK_FILE     $BASE_DIR/backups/build/config_"$TIMESTAMP_UNIX".ini

    #   backup the existing config
    mv -v $GEN_FILE $BAK_FILE

    set -l BUILD_DIR    $BASE_DIR/build_partials
    cd $BUILD_DIR

    #   replace PLACEHOLDER with actual current edits
    #   (note: sed seems not to work with incron)
    sed '/PLACEHOLDER/{
        s/PLACEHOLDER//g
        r 2b_profiles_common.ini
    }' 2a_profiles_template.ini > 2c_profiles_rendered.ini

    #   now compile ...
    cat \
        $BUILD_DIR/1_global.ini \
        $BUILD_DIR/2c_profiles_rendered.ini \
        $BUILD_DIR/3a_layout_default.ini \
        $BUILD_DIR/3b_layout_main.ini \
        $BUILD_DIR/3c_layout_monitoring.ini \
        $BUILD_DIR/4_plugins.ini \
        > $GEN_FILE

    cd $PWD_CACHED

#···············································································
end #  END FUNCTION DEFITION
