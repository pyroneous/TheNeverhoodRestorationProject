/* 
	Begin transmission to some seriously terribad Java code. I am not a Java programmer at all. 
	Oh well, at least it's all from scratch. 
	Enjoy. No README for this one, because it no longer actually affects the process of the Neverhood. It's just a pretty wrapper now.
*/
import java.awt.event.*;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit; 
import java.awt.Font;
import java.awt.Insets;
import java.awt.FontFormatException;
import java.awt.GraphicsEnvironment;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.DataInputStream;
import java.io.FileOutputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.MalformedURLException;
import java.util.Scanner; 
import java.util.List;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.beans.PropertyChangeEvent;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;

import javax.swing.JEditorPane;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JTextArea;
import javax.swing.JScrollPane;
import javax.swing.JOptionPane;
import javax.swing.JDialog;
import javax.swing.BoxLayout;
import javax.swing.SwingUtilities;
import javax.swing.AbstractButton;
import javax.swing.BorderFactory;
import javax.swing.border.EmptyBorder;
import javax.imageio.ImageIO;
public class UpdateMechanism extends JFrame
								implements ActionListener {
	protected static JButton aroundTheLake; 
	protected static JFrame frame;
	protected static String stringThing;
	stringThing = UpdateMechanism.class.getProtectionDomain().getCodeSource().getLocation().toString()+"/DUGFB___.TTF";
	
	private static JButton aroundTheRiver() {
		aroundTheLake = new JButton("DOWNLOAD & INSTALL!");
		aroundTheLake.setVerticalTextPosition(AbstractButton.CENTER);
		aroundTheLake.setHorizontalTextPosition(AbstractButton.LEADING); //aka LEFT, for left-to-right locales
		aroundTheLake.addActionListener(new UpdateMechanism());
		aroundTheLake.setMnemonic(KeyEvent.VK_D);
		aroundTheLake.setActionCommand("aroundthelake");
		return aroundTheLake;
	}

	private static String readURL(String targetURL) {
		String returnish = "";
		try {
			URL tempURL = new URL(targetURL); 
			Scanner s = new Scanner(tempURL.openStream()); 
			while (s.hasNextLine()) {
				returnish = returnish+s.nextLine(); 
			}
		} catch (IOException e) {
			System.out.println(e); 
		}
		return returnish;
	}

	private static String readFile(String targetFile) { 
		String returnString = "";
		try {
			File tempFile = new File(targetFile);
			Scanner s = new Scanner(tempFile);
			while (s.hasNextLine()) {
				returnString = returnString + s.nextLine(); 
			}
		} catch(IOException e) { 
			// !
			System.out.println(e);
		}
		return returnString;
	}

	public void actionPerformed(ActionEvent e) {
		if ("aroundthelake".equals(e.getActionCommand())) {
			JOptionPane.showMessageDialog(frame,
											"Please wait, this may take a while depending on your connection...");
			new Thread() {
				public void run() {
					URL url; 
					URLConnection con;  
					DataInputStream dis;  
					FileOutputStream fos; 
					byte[] fileData;  
					try {
						url = new URL("http://hivelocity.dl.sourceforge.net/project/theneverhood/setup.exe");
						con = url.openConnection(); 
						dis = new DataInputStream(con.getInputStream());
						fileData = new byte[con.getContentLength()]; 
						for (int x = 0; x < fileData.length; x++) { 
							fileData[x] = dis.readByte();
						}
						dis.close(); 
						String myStringThing = getClass().getProtectionDomain().getCodeSource().getLocation().toString()+"/../setup.exe";
						fos = new FileOutputStream(new File(myStringThing.substring(6)));  
						fos.write(fileData);
						fos.close(); 
						
						List<String> command = new ArrayList<String>();
						command.add("cmd");
						command.add("/C");
						File dcr = new File(myStringThing.substring(6));
						dcr.setExecutable(true, false);
						command.add(dcr.getAbsolutePath());
						ProcessBuilder builder = new ProcessBuilder(command);
						builder.redirectErrorStream(true);
						final Process process = builder.start();
						try {
							process.waitFor();
						} catch (InterruptedException ex) {
							Logger.getLogger(UpdateMechanism.class.getName()).log(Level.SEVERE, null, ex);
							throw ex;
						}
						InputStream is = process.getErrorStream();
						InputStreamReader isr = new InputStreamReader(is);
						BufferedReader br = new BufferedReader(isr);
						String line;
						while ((line = br.readLine()) != null) {
							Logger.getLogger(UpdateMechanism.class.getName()).severe(line);
						}
					}
					catch(MalformedURLException m) {
						System.out.println(m);
					}
					catch(IOException io) {
						System.out.println(io);
					}
					catch(InterruptedException ex) {
						System.out.println(ex);
					}
				}   
			}.start();
		} else {
			// man
		}
	}

	private static void showGUI() {
		frame = new JFrame("The Neverhood Restoration Project");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(new Dimension(1024, 600));
		frame.setExtendedState(frame.MAXIMIZED_BOTH);
		frame.getContentPane().setBackground(new Color(0xA64343));

		File fileCheck = new File("C:/Program Files (x86)");
		String returnString = null;
		String rootDirectory = null;
		if (fileCheck.exists()) {
			rootDirectory = "C:/Program Files (x86)/DreamWorks Interactive"; 
			String checkFile = rootDirectory+"/Neverhood/version.txt"; 
			File tempFile = new File(checkFile);
			if (tempFile.exists()) {
				returnString = readFile(checkFile);
			} else {
				returnString = "It appears you do not have the Neverhood Restoration Project installed, or you are using an earlier version."; 
			}
		} else {
			rootDirectory = "C:/Program Files/DreamWorks Interactive";
			String checkFile = rootDirectory+"/Neverhood/version.txt"; 
			File tempFile = new File(checkFile);
			if (tempFile.exists()) {
				returnString = readFile(checkFile);
			} else {
				returnString = "It appears you do not have the Neverhood Restoration Project installed, or you are using an earlier version.";
			}
		}
		if (returnString.equals(readURL("http://theneverhood.sourceforge.net/version.txt"))) {
			returnString = "You are updated to the recent version!"; 
		} else { 
			returnString = "It appears you're not updated.";
		}

		JLabel headerLabel = new JLabel("The Neverhood Restoration Project");
		headerLabel.setHorizontalAlignment(JLabel.CENTER);
		JPanel heapPanel = new JPanel();
		heapPanel.setLayout(new BoxLayout(heapPanel, BoxLayout.PAGE_AXIS));
		heapPanel.setPreferredSize(new Dimension(500, heapPanel.getPreferredSize().height));
		JTextArea heapLabel = new JTextArea(50, 50);        
		heapLabel.setLineWrap(true);
		heapLabel.setWrapStyleWord(true);
		heapLabel.setEditable(false);
		heapLabel.setBorder(BorderFactory.createEmptyBorder(10, 20, 10, 20));
		heapLabel.setFont(new Font("Serif", Font.PLAIN, 14));
		heapLabel.append("Current version: "+readURL("http://theneverhood.sourceforge.net/prettyversion.txt")+".\nInstalled version: "+readFile(rootDirectory+"/Neverhood/prettyversion.txt")+".\n"+returnString+"\n" + 
			"You can read the full version of the document to the left at http://theneverhood.sourceforge.net."
			+ "\nHaven't installed yet? Below is the download button. Just click to save setup.exe in and enjoy!");
		heapPanel.add(heapLabel);
		if (returnString.equals("It appears you're not updated.")) { 
			heapPanel.add(aroundTheRiver());
		}
		
		try {
			Font sFont = Font.createFont(Font.TRUETYPE_FONT, new File(stringThing.substring(6)));
			sFont = sFont.deriveFont(Font.PLAIN, 48);
			GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
			ge.registerFont(sFont);
			headerLabel.setFont(sFont);
		} catch (FontFormatException | IOException e) {
			System.out.println(e);
		}

		BufferedImage icoImage = null;
		try {
			icoImage = ImageIO.read(
				frame.getClass().getResource("/nhood.bmp"));
		} catch (IOException e) {
			System.out.println(e);
		}
		frame.setIconImage(icoImage);

		JEditorPane updateLog = new JEditorPane();
		JScrollPane scrollPane = new JScrollPane(updateLog);
		updateLog.setEditable(false);

		try {
			updateLog.setPage("http://theneverhood.sourceforge.net/");
		} catch (IOException e) {
			updateLog.setContentType("text/html");
			updateLog.setText("<html>The application could not load the webpage.</html>");
		}

		frame.add(headerLabel, BorderLayout.NORTH);
		frame.add(scrollPane);
		frame.add(heapPanel, BorderLayout.EAST);
		frame.pack();
		frame.setVisible(true);
	}


	public static void main(String[] args) {
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				showGUI();
			}
		});
	}
}