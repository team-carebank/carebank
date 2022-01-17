package com.yee.carebank.model.biz;

import java.io.IOException;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
@PropertySource("classpath:aws/credentials.properties")
public class AwsS3Biz {

	@Autowired
	private AmazonS3 s3Client;

	@Value("${bucketname}")
	private String bucketName;

	public String uploadObject(MultipartFile multipartFile, String storedFileName) throws IOException {
		String filePath = "img/" + storedFileName;
		s3Client.putObject(new PutObjectRequest(bucketName, filePath, multipartFile.getInputStream(), null));

		return s3Client.getUrl(bucketName, filePath).toString();
	}

	public void deleteObject(String storedFileName) throws AmazonServiceException {
		s3Client.deleteObject(new DeleteObjectRequest(bucketName + "img/", storedFileName));
	}

}
