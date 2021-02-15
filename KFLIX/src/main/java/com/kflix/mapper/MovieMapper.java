package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.movie.domain.Movie;

public interface MovieMapper {

	/*
	 * ��ü ����Ʈ , Y or N
	 */
	List<Movie> getAllMovieView(char status);
	
	// ��
	Movie getMovieById(int movie_id);
	
	// �߰�
	int addMovie(Movie movie);
	
	/*
	 * ���� / ���� , Y or N
	 */
	int deleteOrRecoveryMovie(
						@Param("movie_id") int movie_id, 
						@Param("status") char status);
	
	// ����
	int updateMovie(Movie movie);

	
}
