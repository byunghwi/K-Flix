package com.kflix.movie.mapper;

import java.util.List;

import com.kflix.movie.domain.Movie;

public interface MovieMapper {

	// ��ü
	List<Movie> getAllMovieView();
	
	// ��
	Movie getMovieById(int movie_id);
	
	// �߰�
	int addMovie(Movie movie);
	
	// ����
	int deleteMovie(int movie_id);
	
	// ����
	int updateMovie(Movie movie);
	
}
