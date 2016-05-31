# SymSim

Create symbolic links to CoreSimulator directories to make it easier to find them. The directories are created in a hierarchy of `<operating system>/<version>/<model>`.

# Building

If you have Xcode 7.3.1 installed you can build from the command line and create a link to the binary in `/usr/local/bin`:

    git clone https://github.com/russbishop/SymSim.git
    cd SymSim/source/SymSim
    xcodebuild
    ln build/Release/SymSim /usr/local/bin/symsim

# Examples

List all the iPad simulators running iOS 9.x: `symsim -p --type iPad --major 9 --minor 2`

    iPad-Retina		(iOS 9.2)	[CD1438C8-D5A7-457E-82E4-FDE900E43858]
    iPad-2			(iOS 9.2)	[7646E312-B8BA-485E-8FCD-7CAB2B2190AF]
    iPad-Air		(iOS 9.2)	[2435720B-28EC-491C-833C-F8460E1F2B28]
    iPad-Air-2		(iOS 9.2)	[ECAB4798-82D9-4D6A-83C4-1AA7ED38160D]
    iPad-Pro		(iOS 9.2)	[9C3B24FF-3373-4581-A10D-94691932EA72]


Create symlinks to all iOS 9.x simulators in `/tmp`: `symsim -c -o "/tmp" --os iOS --major 9`

    Creating [/tmp/iOS/9-3/iPhone-4s] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/B83097C7-64DB-41C6-9078-9699A644E2D9/data]... Success!
    Creating [/tmp/iOS/9-3/iPhone-6s-Plus] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/8A543A09-8F29-4B77-B66A-16C53A239A73/data]... Success!
    Creating [/tmp/iOS/9-3/iPhone-5s] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/4704A8ED-3566-4F51-8BB3-884FD2BE6B23/data]... Success!
    Creating [/tmp/iOS/9-3/iPad-Retina] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/220C10ED-35CC-47DA-AA51-2000979BE20F/data]... Success!
    Creating [/tmp/iOS/9-3/iPad-2] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/AD69738C-4EA8-48C5-9B72-4CF8B0126491/data]... Success!
    Creating [/tmp/iOS/9-3/iPad-Air] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/C09DA9DB-4904-4F24-87F7-E51F172C75F3/data]... Success!
    Creating [/tmp/iOS/9-3/iPhone-6s] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/682721FD-BCCB-4720-BDBB-A146627198CD/data]... Success!
    Creating [/tmp/iOS/9-3/iPad-Air-2] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/E800E047-46E2-4B31-BC2A-79A643AC0DB9/data]... Success!
    Creating [/tmp/iOS/9-3/iPhone-6] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/83DA70F1-B815-447C-AC8E-F41DAD6CCDCB/data]... Success!
    Creating [/tmp/iOS/9-3/iPhone-6-Plus] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/432F161A-7E26-4A5F-9211-C1ECAA93C49C/data]... Success!
    Creating [/tmp/iOS/9-3/iPhone-5] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/0D723651-44E5-4B86-B8C0-7F5CA5CFC216/data]... Success!
    Creating [/tmp/iOS/9-3/iPad-Pro] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/3A6D8257-72F6-4E39-BFD4-1D645DD4B745/data]... Success!
    Creating [/tmp/iOS/9-2/iPhone-4s] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/17E2E2E9-F8D6-4605-A526-C674FD3A39F3/data]... Success!
    Creating [/tmp/iOS/9-2/iPhone-6s-Plus] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/B7EE11F9-DCD1-45E1-839D-69567654588B/data]... Success!
    Creating [/tmp/iOS/9-2/iPhone-5s] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/DC27E638-39E4-4C4A-8976-53F02409C9C8/data]... Success!
    Creating [/tmp/iOS/9-2/iPad-Retina] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/CD1438C8-D5A7-457E-82E4-FDE900E43858/data]... Success!
    Creating [/tmp/iOS/9-2/iPad-2] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/7646E312-B8BA-485E-8FCD-7CAB2B2190AF/data]... Success!
    Creating [/tmp/iOS/9-2/iPad-Air] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/2435720B-28EC-491C-833C-F8460E1F2B28/data]... Success!
    Creating [/tmp/iOS/9-2/iPhone-6s] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/185F35EC-BB15-4CF8-ADF6-6C1C6343DB2D/data]... Success!
    Creating [/tmp/iOS/9-2/iPad-Air-2] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/ECAB4798-82D9-4D6A-83C4-1AA7ED38160D/data]... Success!
    Creating [/tmp/iOS/9-2/iPhone-6] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/F80A65D3-50B2-46D0-B1FB-9E202CBD5BC5/data]... Success!
    Creating [/tmp/iOS/9-2/iPhone-6-Plus] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/F586216B-729F-482A-B583-AACEE516E0F6/data]... Success!
    Creating [/tmp/iOS/9-2/iPhone-5] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/E4D733E3-94B5-4C49-9932-2B0C91A7F46D/data]... Success!
    Creating [/tmp/iOS/9-2/iPad-Pro] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/9C3B24FF-3373-4581-A10D-94691932EA72/data]... Success!
    Creating [/tmp/iOS/9-0/iPhone-6s-Plus] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/C475F7F4-C2A1-4F39-8C4A-6F7F62329AF8/data]... Success!
    Skipping [/tmp/iOS/9-0/iPad-Retina] because target does not exist (that simulator may not have been booted yet)
    Skipping [/tmp/iOS/9-0/iPhone-5s] because target does not exist (that simulator may not have been booted yet)
    Skipping [/tmp/iOS/9-0/iPhone-4s] because target does not exist (that simulator may not have been booted yet)
    Skipping [/tmp/iOS/9-0/iPad-Air] because target does not exist (that simulator may not have been booted yet)
    Skipping [/tmp/iOS/9-0/iPad-2] because target does not exist (that simulator may not have been booted yet)
    Creating [/tmp/iOS/9-0/iPhone-6s] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/E4776562-6850-492D-9409-E1C417629612/data]... Success!
    Skipping [/tmp/iOS/9-0/iPad-Air-2] because target does not exist (that simulator may not have been booted yet)
    Skipping [/tmp/iOS/9-0/iPhone-6] because target does not exist (that simulator may not have been booted yet)
    Skipping [/tmp/iOS/9-0/iPhone-6-Plus] because target does not exist (that simulator may not have been booted yet)
    Skipping [/tmp/iOS/9-0/iPhone-5] because target does not exist (that simulator may not have been booted yet)
    Creating [/tmp/iOS/9-1/iPhone-4s] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/226E2664-87D2-42B0-88A7-E52809DBC33F/data]... Success!
    Creating [/tmp/iOS/9-1/iPhone-6s-Plus] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/3CD3AB22-341D-45DB-92B6-DDB5E53569E0/data]... Success!
    Creating [/tmp/iOS/9-1/iPhone-5s] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/E332F0B3-E31B-4FD4-8967-EFDC4ADD50D9/data]... Success!
    Creating [/tmp/iOS/9-1/iPad-Retina] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/E99E3EB9-DBF0-49F0-A314-2B2773FB33BA/data]... Success!
    Creating [/tmp/iOS/9-1/iPad-2] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/DDC9B329-B087-427C-B025-57DD46A35A90/data]... Success!
    Creating [/tmp/iOS/9-1/iPad-Air] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/972D76B6-5894-4BCD-87F7-ED08E752D8C6/data]... Success!
    Creating [/tmp/iOS/9-1/iPhone-6s] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/E60A0EDA-ECF7-4900-B5DC-C148C6ED8444/data]... Success!
    Creating [/tmp/iOS/9-1/iPad-Air-2] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/FF2D0B56-4F27-4A06-A422-ED189C1CE64C/data]... Success!
    Creating [/tmp/iOS/9-1/iPhone-6] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/CF840E45-6DF1-40DC-9E77-940010A1B1BA/data]... Success!
    Creating [/tmp/iOS/9-1/iPhone-6-Plus] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/4D65DDA2-1F3E-41BB-BB1E-62637F81C44E/data]... Success!
    Creating [/tmp/iOS/9-1/iPhone-5] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/EC25D24E-7E33-4B96-B45F-D0F96D5522E3/data]... Success!
    Creating [/tmp/iOS/9-1/iPad-Pro] -> [/Users/russ/Library/Developer/CoreSimulator/Devices/D1ED037D-A0D9-4740-8C49-538F09150472/data]... Success!

If a simulator has never been booted it may not have an actual data directory. In that case, creation will skip creating the link (otherwise the link would go nowhere).

# Usage

    -p, --print:
        Print the list of available devices
        
    -c, --create:
        Create links to the available devices or update existing links
        
    -o, --outdir:
        Output directory to place links in. Defaults to '.'
        
    --simdir:
        CoreSimulator device directory. Defaults to '~/Library/Developer/CoreSimulator/Devices/'
        
    --nocolor:
        Disable colorized output. Defaults to false (colors enabled)
        
    --type:
        Filter to only device type (One of: iPad, iPhone, tv, watch)
        
    --os:
        Filter to only operating system (One of: iOS, tvOS, watchOS)
        
    --major:
        Filter to only operating system major version (eg: 9 for iOS 9.x)
        
    --minor:
        Filter to only operating system minor version (eg: 1 for iOS x.1)




# TODO

* Create a binary distribution and/or add to homebrew.
* Currently the dependencies are directly included so there are no issues finding frameworks, but they should at least be git submodules.
* Scan the containers to find out which directories contain which apps, then add the ability to print the app bundle identifiers and/or create symbolic links to the apps as well
* Bare or "porcelin" mode that will print just a target path or path(s) for use with other tools

# License

MIT licensed