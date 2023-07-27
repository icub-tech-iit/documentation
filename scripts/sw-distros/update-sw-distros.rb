#!/usr/bin/env ruby

# Copyright: (C) 2020 iCub Tech Facility - Istituto Italiano di Tecnologia
# Authors: Ugo Pattacini <ugo.pattacini@iit.it>


#########################################################################################
# deps
require 'fileutils'
require 'yaml'


#########################################################################################
# global vars
$superbuild_tag = ENV['SUPERBUILD_TAG']
$initial_distro = ENV['INITIAL_DISTRO']
$superbuild_releases_path = ENV['SUPERBUILD_RELEASES_PATH']
$versioning_table_path = ENV['SW_VERSIONING_TABLE_PATH']


#########################################################################################
def get_distro_files()
    aggregate_initial_distro = 0
    if !$initial_distro.empty? then
        fields = $initial_distro.split('.')
        aggregate_initial_distro = 100 * fields[0].to_i + fields[1].to_i
    end

    files = Dir.entries($superbuild_releases_path)
    files_filtered = []

    if files then
        files.each { |file|
            if !file.casecmp?('.') && !file.casecmp?('..') then
                fields = file.split('.')
                if fields.size() >= 2 then
                    # check if fields are numeric
                    if fields[0].count("^0-9").zero? && fields[1].count("^0-9").zero? then
                        aggregate = 100 * fields[0].to_i + fields[1].to_i
                        if aggregate >= aggregate_initial_distro then
                            files_filtered << file
                        end
                    end
                end
            end
        }
    end

    return files_filtered
end


#########################################################################################
def write_package(mkd, pckg, url, version)
    mkd.write "| [**`#{pckg}`**](#{url}) | #{url} | `#{version}` |\n"
end


#########################################################################################
def process_distro(name, file)
    puts "📦 Processing Distro #{name}..."
    distro = YAML.load_file($superbuild_releases_path + "/" + file)
    packages_preferred_order = YAML.load_file("packages_preferred_order.yml")
    mkdown_file = $versioning_table_path + "/" + name + ".md"
    File.new(mkdown_file, 'w')
    File.open(mkdown_file, "w") { |mkd|
        mkd.write "📦 Distro #{name}\n"
        mkd.write "===\n\n"
        mkd.write "| CMake Packages | Repositories | Versions |\n"
        mkd.write "| :--- | :--- | :--- |\n"
        repos = distro["repositories"]

        # first off, process those packages we aim to show topmost
        ordered_pckgs = packages_preferred_order["packages_preferred_order"]
        if ordered_pckgs then
            ordered_pckgs.each { |pckg|
                if repos.key?(pckg) then
                    write_package(mkd, pckg, repos[pckg]["url"], repos[pckg]["version"])
                end
            }
        end

        # proceed with the remaining packages
        if repos then
            repos.each { |pckg, vals|
                if !ordered_pckgs.include?(pckg) then
                    write_package(mkd, pckg, vals["url"], vals["version"])
                end
            }
        end
    }
    puts "...done ✔"
end


#########################################################################################
# main

# retrieve information from files
distro_files = get_distro_files()

# cycle over distros
if distro_files then
    FileUtils.mkdir_p($versioning_table_path)
    index = $versioning_table_path + "/index.md"
    FileUtils.cp("template_index.md", index)
    File.open(index, "a") { |mkd|
        mkd.write "## Table\n"
        mkd.write "This table has been generated automatically by processing data available in "
        mkd.write "[`robotology/robotology-superbuild@#{$superbuild_tag}/releases`](https://github.com/robotology/robotology-superbuild/tree/#{$superbuild_tag}/releases).\n\n"
        mkd.write "Click on the distros below to explore their package versions:\n\n"
        # the latest distro is topmost
        distro_files.sort.reverse.each { |file|
            name = file.rpartition('.').first
            process_distro(name, file)
            mkd.write "- [📦 Distro **#{name}**](./#{name}.md){:target=\"_blank\"}\n"
        }
    }
end
