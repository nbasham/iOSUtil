iOSUtil
=======
	 • DelimitedFile

DelimitedFile - creates an array of objects from a tab or comma separated file. 

<b>Example:</b> Given a class Band (full example in sample project):

	@interface Band : NSObject<TabSeparatedFileDelegate>
	
	@property(nonatomic, assign)int uid;
	@property(nonatomic, strong)NSString* name;
	@property(nonatomic, strong)NSArray* members;

And the tab separated file named "data.tsv":
<table>
    <tr>
        <td>1</td>
        <td>Crazy Horse</td>
        <td>Billy,Pancho,Ralph,Neil,Danny</td>
    </tr>
    <tr>
        <td>2</td>
        <td>The Band</td>
        <td>Rick,Levon,Garth,Richard,Robbie,Jim,Stan,Randy,Richard</td>
    </tr>
</table>

Code: creates an array of Band objects from the file above:

    NSArray* bands = [DelimitedFileDelimitedFile loadTSV:@"data.tsv" toClass:[Band class]];

Similarly, you can do the same with comma separated (CSV) files (see sample project). Adding one method will allow use of any delimiter.