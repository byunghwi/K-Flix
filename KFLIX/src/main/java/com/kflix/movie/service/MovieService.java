package com.kflix.movie.service;

import java.util.List;

import com.kflix.movie.domain.Movie;

public interface MovieService {

	// ��ü
	public List<Movie> selectAllMovieVeiw(char status);

	// ��
	public Movie selectMovieById(int movie_id);
	
	// ���
	public int insertNewMovie(Movie movie);
		
	// ����
	public int updateMovie(Movie movie);

	// ����
	public int deleteOrRecoveryMovieById(int movie_id, char status);
	
}
