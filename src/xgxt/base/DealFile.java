/*
 * 创建日期 2006-5-13
 * 
 *  要更改此生成的文件的模板，请转至 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package xgxt.base;

import java.io.*;

public class DealFile {
	/** 输入文件 */
	String infile = "";

	/** 输出文件 */
	String outfile = "";

	/** 输入文件流 */
	FileInputStream fis = null;

	/** 输出文件流 */
	FileOutputStream fos = null;

	public DealFile() {
	}

	/** 建立输入文件流 */
	public void connFIS(String i) {
		try {
			infile = i;
			fis = new FileInputStream(infile);
		} catch (IOException ioe) {
			System.out.println("调用DealFile.connFIS()函数错误:\r\n" + ioe);
		}
	}

	// 建立输出文件流*/
	public void connFOS(String o) {
		try {
			outfile = o;
			fos = new FileOutputStream(outfile);
		} catch (IOException ioe) {
			System.out.println("调用DealFile.connFOS()函数错误:\r\n" + ioe);
		}
	}

	/** 关闭输入文件流 */
	public void closeFIS() {
		try {
			if (fis != null) {
				fis.close();
			}
		} catch (IOException ioe) {
			System.out.println("调用DealFile.closeFIS()函数错误:\r\n" + ioe);
		}
	}

	/** 关闭输出文件流 */
	public void closeFOS() {
		try {
			if (fos != null) {
				fos.close();
			}
		} catch (IOException ioe) {
			System.out.println("调用DealFile.closeFOS()函数错误:\r\n" + ioe);
		}
	}

	/** 取得输入流 */
	public FileInputStream getFIS() {
		return fis;
	}

	/** 取得输出流 */
	public FileOutputStream getFOS() {
		return fos;
	}

	/** 删除文件 */
	public void deleteFile(String df) {
		File file = new File(df);
		file.delete();
	}

	/** 拷贝文件内容fis->fos */
	public void movefile_FileStream() {
		try {
			File f = new File(infile);
			byte b[] = new byte[(int) (f.length())];
			fis.read(b);
			fos.write(b);
		} catch (IOException ioe) {
			System.out.println("调用DealFile.movefile_FileStream()函数错误:\r\n"
					+ ioe);
		}
	}

	/** 拷贝文件内容fis->fos */
	public void movefile_BufferedByteStream() {
		try {
			BufferedInputStream in = new BufferedInputStream(fis);
			BufferedOutputStream out = new BufferedOutputStream(fos);
			int c;
			while ((c = in.read()) != -1) {
				out.write(c);
			}
			in.close();
			out.close();
		} catch (IOException ioe) {
			System.out
			.println("调用DealFile.movefile_BufferedByteStream()函数错误:\r\n"
					+ ioe);
		}
	}

	/** 拷贝文件内容infile->outfile */
	public void movefile_BufferedCharStream() {
		try {
			BufferedReader in = new BufferedReader(new FileReader(infile));
			BufferedWriter out = new BufferedWriter(new FileWriter(outfile));
			int c;
			while ((c = in.read()) != -1) {
				out.write(c);
			}
			in.close();
			out.close();
		} catch (IOException ioe) {
			System.out
			.println("调用DealFile.movefile_BufferedCharStream()函数错误:\r\n"
					+ ioe);
		}
	}

	/** 读中文字符串infile-> */
	public String readCHStr() {
		return readCHStr(fis);
	}

	/** 读中文字符串infile-> */
	public String readCHStr(InputStream is) {
		String str = "";
		try {
			// 建立Unicode字符流
			InputStreamReader isw = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isw);

			// 读Unicode字符串
			String s = "";
			while ((s = br.readLine()) != null) {
				if (!str.equals("")) {
					str = str + "\r\n" + s;
				} else {
					str = str + s;
				}
			}

			br.close();
			isw.close();
		} catch (IOException ioe) {
			System.out.println("调用DealFile.readCHStr()函数错误:\r\n" + ioe);
		}
		return str;
	}

	/** 将字符串转换为数据流 */
	public FileInputStream toInputStream(String str) {
		FileInputStream fis_t = null;
		try {
			// 将字符串写入临时文件，再从文件生成数据流
			FileOutputStream fos_t = new FileOutputStream("tmp.txt");
			writeCHStr(fos_t, str);
			fis_t = new FileInputStream("tmp.txt");
		} catch (IOException ioe) {
			System.out.println("调用DealFile.toInputStream()函数错误:\r\n" + ioe);
		}
		return fis_t;
	}

	/** 写中文字符串到文件->outfile */
	public void writeCHStr(String str) {
		writeCHStr(fos, str);
	}

	/** 写中文字符串到文件->outfile */
	public void writeCHStr(OutputStream os, String str) {
		try {
			// 建立Unicode字符流
			OutputStreamWriter osw = new OutputStreamWriter(os);
			BufferedWriter bw = new BufferedWriter(osw);

			// 写Unicode字符串
			bw.write(str, 0, str.length());
			bw.newLine();
			bw.close();
			osw.close();
		} catch (IOException ioe) {
			System.out.println("调用DealFile.writeCHStr()函数错误:\r\n" + ioe);
		}
	}

	/** 追加到文件结尾 */
	public void appendCHStr(String outfile, String str) {
		try {
			RandomAccessFile rf = new RandomAccessFile(outfile, "rw");
			rf.seek(rf.length());
			rf.writeBytes(str);
			rf.close();
		} catch (IOException ioe) {
			System.out.println("调用DealFile.appendCHStr()函数错误:\r\n" + ioe);
		}
	}

	/** 从位置cur开始检索第一个str的位置 */
	public long seekStrPos(long cur, String str) {
		long fcur = cur;
		try {
			RandomAccessFile file = new RandomAccessFile(new File(infile), "r");
			long flen = file.length();
			int slen = str.length();
			byte[] b = new byte[slen];

			for (; fcur < flen; fcur++) {
				file.seek(fcur);

				// 文件尾剩余长度不再够时
				if ((flen - fcur) < slen) {
					fcur = -1;
					break;
				}

				// 判断当前位置是否是，不是则继续搜索
				file.read(b, 0, slen);
				String bstr = new String(b);
				if (str.equals(bstr)) {
					break;
				}
			}
			file.close();
		} catch (IOException ioe) {
			System.out.println("调用DealFile.seekStrPos()函数错误:\r\n" + ioe);
		}
		return fcur;
	}

	/** 定位某一个字符串在文件中的位置(左起) */
	public long seekStrPos(String str) {
		return seekStrPos(0, str);
	}

	/** 定位从字符串str1开始第一个字符串str2的位置 */
	public long seekStrPos(String str1, String str2) {
		long cur = seekStrPos(0, str1);
		return seekStrPos(cur, str2);
	}

	/** 从pos位置开始去长度为len的字符串 */
	public String substring(long pos, int len) {
		String str = "";
		try {
			RandomAccessFile file = new RandomAccessFile(new File(infile), "r");
			long flen = file.length();

			// 当不能返回时返回空值
			if ((pos < 0) || ((flen - pos) < len)) {
				return "";
			}

			file.seek(pos);
			byte[] b = new byte[len];
			file.read(b, 0, len);
			str = new String(b);
			file.close();
		} catch (IOException ioe) {
			System.out.println("调用DealFile.substring()函数错误:\r\n" + ioe);
		}
		return str;
	}

	/** 从字符串str1开始检索str2后的长度为len的字符串 */
	public String substring(String str1, String str2, int len) {
		long pos = seekStrPos(str1, str2);
		return substring(pos + str2.length(), len).trim();
	}

}