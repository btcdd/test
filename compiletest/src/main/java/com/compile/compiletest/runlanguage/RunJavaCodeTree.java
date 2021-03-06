package com.compile.compiletest.runlanguage;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import com.compile.compiletest.vo.CodeVo;

public class RunJavaCodeTree {
	
	private Long authUserNo;
	private Long problemNo;
	private Long subProblemNo;
	
	private StringBuffer buffer;
	private Process process;
	private BufferedReader bufferedReader;
	private BufferedReader bufferedReader2;
	private StringBuffer readBuffer;
	
	private File file;
	private BufferedWriter bufferWriter;
	
	private final String FILENAME = "Test.java";
	
	public RunJavaCodeTree(Long authUserNo, Long problemNo, Long subProblemNo) {
		this.authUserNo = authUserNo;
		this.problemNo = problemNo;
		this.subProblemNo = subProblemNo;
	}

	public void createFileAsSource(String source, String fileName) {
		try {
			file = new File("/userDirectory/user" + authUserNo + "/prob" + problemNo + "/subProb" + subProblemNo + "/java/" + fileName);
			bufferWriter = new BufferedWriter(new FileWriter(file, false));
			
			bufferWriter.write(source);
			bufferWriter.flush();
		} catch(Exception e) {
			e.printStackTrace();
			System.exit(1);
		} finally {
			try {
				bufferWriter.close();
				file = null;
			} catch (IOException e) {
				e.printStackTrace();
				System.exit(1);
			}
		}
	}
	
	public String execCompile(List<CodeVo> codeVoListTrue) {
		try {
			String javafile = "./userDirectory/user1/prob2/subProb4/java/Test.java\r\n" + 
					"./userDirectory/user1/prob2/subProb4/java/A.java\r\n" + 
					"./userDirectory/user1/prob2/subProb4/java/B.java";
			
			createFileAsSource(javafile, "javafile.txt");
			
//			for(int i = codeVoListTrue.size() - 1; i >= 0; i--) {
				process = Runtime.getRuntime().exec("javac -d /userDirectory/user1/prob2/subProb4/java/ @./userDirectory/user1/prob2/subProb4/java/javafile.txt");	
//			}
			
			bufferedReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
			String line = null;
			readBuffer = new StringBuffer();
			
			while((line = bufferedReader.readLine()) != null) {
				readBuffer.append(line);
				readBuffer.append("\n");
			}
			return readBuffer.toString();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String execCommand() {
		try {
			process = Runtime.getRuntime().exec(runClass());
			
			bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
			bufferedReader2 = new BufferedReader(new InputStreamReader(process.getErrorStream()));
						
			String line = null;
			readBuffer = new StringBuffer();
			
			while((line = bufferedReader.readLine()) != null) {
				readBuffer.append(line);
				readBuffer.append("\n");
			}
			while((line = bufferedReader2.readLine()) != null) {
				readBuffer.append(line);
				readBuffer.append("\n");
			}
			return readBuffer.toString();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	private String runClass() {
		buffer = new StringBuffer();
		
		buffer.append("java -cp /userDirectory/user1/prob2/subProb4/java/ Test");
		
		return buffer.toString();
	}
	
	public String execSave(String cmd) {
		try {
			process = Runtime.getRuntime().exec(cmd);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}